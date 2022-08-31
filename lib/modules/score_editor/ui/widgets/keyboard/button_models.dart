// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/score_editor/cubit/focused_bar/focused_bar_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/keyboard_event/keyboard_event.dart';
import 'package:solpha/modules/score_editor/cubit/score/score_cubit_cubit.dart';

class ButtonModel {
  const ButtonModel();

  String displayString() {
    return '';
  }

  Widget? icon() {}

  void action(BuildContext context) {}
}

class MusicNoteButton implements ButtonModel {
  final Solfege solfa;
  final int octave;
  const MusicNoteButton({
    required this.solfa,
    required this.octave,
  });

  @override
  String displayString() {
    String level = (octave > 0) ? "'" : ",";
    return solfa.symbol + level * octave.abs();
  }

  @override
  void action(BuildContext context) {
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
  Widget? icon() {}
}

class DurationNoteButton implements ButtonModel {
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
    Note note = Note.duration(
      marker: marker,
      createdAt: DateTime.now().toUtc(),
    );
    BlocProvider.of<SolfaKeyBoardInputEventCubit>(context).insertNotes([
      note
    ]);
  }

  @override
  Widget? icon() {}
}

class DeleteNoteButton implements ButtonModel {
  const DeleteNoteButton();

  @override
  String displayString() {
    return "⇐";
  }

  @override
  void action(BuildContext context) {
    BlocProvider.of<SolfaKeyBoardInputEventCubit>(context).backSpace();
  }

  @override
  Widget? icon() {
    return Center(
      child: Icon(
        Icons.backspace_outlined,
        size: 16,
      ),
    );
  }
}

class SpaceBarButton implements ButtonModel {
  const SpaceBarButton();

  @override
  String displayString() {
    return '';
  }

  @override
  void action(BuildContext context) {
    Note note = WhiteSpaceNote(
      createdAt: DateTime.now().toUtc(),
    );
    BlocProvider.of<SolfaKeyBoardInputEventCubit>(context).insertNotes([
      note
    ]);
  }

  @override
  Widget? icon() {}
}

class NewLineButton implements ButtonModel {
  const NewLineButton();

  @override
  String displayString() {
    return '↵';
  }

  @override
  void action(BuildContext context) {
    Bar? focusedBar = BlocProvider.of<FocusedBarCubit>(context).state;
    if (focusedBar != null) {
      var newBar = BlocProvider.of<ScoreCubit>(context).addBar(focusedBar);
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        BlocProvider.of<FocusedBarCubit>(context).focusBar(newBar);
      });
    }
  }

  @override
  Widget? icon() {
    return Center(
      child: Icon(
        Icons.subdirectory_arrow_left_outlined,
        size: 16,
      ),
    );
  }
}
