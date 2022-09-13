// ignore_for_file: prefer_const_constructors

import 'package:audiolizer/modules/project_editor/cubit/current_bar_group_index/current_bar_group_index.dart';
import 'package:audiolizer/modules/project_editor/cubit/play_score/play_score_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_auto_scroll/toggle_auto_scroll.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_edit_play_mode/toggle_edit_play_mode_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/undo_redo/undo_redo_cubit.dart';
import 'package:audiolizer/modules/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audiolizer/modules/models/bar/bar.dart';
import 'package:audiolizer/modules/models/notes/enums/duration_markers.dart';
import 'package:audiolizer/modules/models/notes/enums/solfege.dart';
import 'package:audiolizer/modules/models/notes/note.dart';
import 'package:audiolizer/modules/project_editor/cubit/focused_bar/focused_bar_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/keyboard_event/keyboard_event.dart';

class ButtonModel {
  const ButtonModel();

  String displayString() {
    return '';
  }

  bool get canLongPress => false;

  Widget? icon(BuildContext context) {}

  void action(BuildContext context) {
    BlocProvider.of<UndoRedoCubit>(context).takeSnapShot();
  }
}

class MusicNoteButton extends ButtonModel {
  final Solfege solfa;
  final int octave;
  const MusicNoteButton({
    required this.solfa,
    required this.octave,
  });

  @override
  String displayString() {
    return Note.music(solfa: solfa, octave: octave, createdAt: DateTime.now()).displayString();
  }

  @override
  void action(BuildContext context) {
    super.action(context);
    Note note = Note.music(
      solfa: solfa,
      octave: octave,
      createdAt: DateTime.now().toUtc(),
    );
    BlocProvider.of<SolfaKeyBoardInputEventCubit>(context).insertNotes([
      note
    ]);
  }

  @override
  Widget? icon(BuildContext context) {}
}

class DurationNoteButton extends ButtonModel {
  final DurationMarker marker;

  const DurationNoteButton({
    required this.marker,
  });

  @override
  String displayString() {
    return marker.symbol;
  }

  @override
  void action(BuildContext context) {
    super.action(context);
    Note note = Note.duration(
      marker: marker,
      createdAt: DateTime.now().toUtc(),
    );
    BlocProvider.of<SolfaKeyBoardInputEventCubit>(context).insertNotes([
      note
    ]);
  }

  @override
  Widget? icon(BuildContext context) {}
}

class DeleteNoteButton extends ButtonModel {
  const DeleteNoteButton();

  @override
  final bool canLongPress = true;

  @override
  String displayString() {
    return "⇐";
  }

  @override
  void action(BuildContext context) {
    super.action(context);
    BlocProvider.of<SolfaKeyBoardInputEventCubit>(context).backSpace();
  }

  @override
  Widget? icon(BuildContext context) {
    return Center(
      child: Icon(
        Icons.backspace_outlined,
        size: 16,
      ),
    );
  }
}

class SpaceBarButton extends ButtonModel {
  const SpaceBarButton();
  final bool canLongPress = true;

  @override
  String displayString() {
    return '';
  }

  @override
  void action(BuildContext context) {
    super.action(context);
    Note note = WhiteSpaceNote(
      createdAt: DateTime.now().toUtc(),
    );
    BlocProvider.of<SolfaKeyBoardInputEventCubit>(context).insertNotes([
      note
    ]);
  }

  @override
  Widget? icon(BuildContext context) {}
}

class NewLineButton extends ButtonModel {
  const NewLineButton();

  @override
  String displayString() {
    return '↵';
  }

  @override
  void action(BuildContext context) {
    super.action(context);
    Bar? focusedBar = BlocProvider.of<FocusedBarCubit>(context).state;
    if (focusedBar != null) {
      var newBar = BlocProvider.of<SolfaKeyBoardInputEventCubit>(context).addBar(focusedBar);
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        BlocProvider.of<FocusedBarCubit>(context).focusBar(newBar);
      });
    }
  }

  @override
  Widget? icon(BuildContext context) {
    return Center(
      child: Icon(
        Icons.arrow_downward,
        size: 16,
      ),
    );
  }
}

class NewLineUpButton extends ButtonModel {
  const NewLineUpButton();

  @override
  String displayString() {
    return '↵';
  }

  @override
  void action(BuildContext context) {
    super.action(context);
    Bar? focusedBar = BlocProvider.of<FocusedBarCubit>(context).state;
    if (focusedBar != null) {
      var newBar = BlocProvider.of<SolfaKeyBoardInputEventCubit>(context).addBarUp(focusedBar);
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        BlocProvider.of<FocusedBarCubit>(context).focusBar(newBar);
      });
    }
  }

  @override
  Widget? icon(BuildContext context) {
    return Center(
      child: Icon(
        Icons.arrow_upward,
        size: 16,
      ),
    );
  }
}

class PlayPauseButton extends ButtonModel {
  const PlayPauseButton();

  @override
  String displayString() {
    return '';
  }

  @override
  void action(BuildContext context) async {
    var bar = BlocProvider.of<FocusedBarCubit>(context).state;
    var barGroupIndex = await BlocProvider.of<FocusedBarCubit>(context).barGroupIndexStream.first;
   
    if (bar != null) {
      BlocProvider.of<PlayScoreCubit>(context).playSingleBar(bar, barGroupIndex);
    }
  }

  @override
  Widget? icon(BuildContext context) {
    return BlocProvider(
      create: (context) => ToggleEditPlayModeCubit(),
      child: Center(
        child: Builder(builder: (context) {
          return BlocBuilder<ToggleEditPlayModeCubit, ToggleEditPlayModeState>(
            builder: (context, state) {
              switch (state) {
                case ToggleEditPlayModeState.edit:
                  return Icon(
                    Icons.play_arrow,
                  );

                case ToggleEditPlayModeState.playing:
                  return Icon(
                    Icons.pause,
                    color: AppColors.instance.primary,
                  );
              }
            },
          );
        }),
      ),
    );
  }
}
