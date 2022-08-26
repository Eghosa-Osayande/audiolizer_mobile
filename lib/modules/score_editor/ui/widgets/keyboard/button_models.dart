// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/notes/white_space_note.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/score_editor/cubit/current_bar_key/current_bar_cubit.dart';

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
    Note note = Note.music(solfa: solfa, octave: octave);
    BlocProvider.of<CurrentBarCubit>(context).state.solfaEditingController.insertNotes([
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
    Note note = Note.duration(marker: marker);
    BlocProvider.of<CurrentBarCubit>(context).state.solfaEditingController.insertNotes([
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
    var solfaEditingController2 = BlocProvider.of<CurrentBarCubit>(context).state.solfaEditingController;

    if (solfaEditingController2.notes.isEmpty) {
      var currentBar = BlocProvider.of<CurrentBarCubit>(context).state;
      if (currentBar.previous != null) {
        var prev = currentBar.previous!;
        currentBar.unlink();
        BlocProvider.of<CurrentBarCubit>(context).setKey(prev);
      }
    } else {
      solfaEditingController2.backSpace();
    }
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
    Note note = WhiteSpaceNote();
    BlocProvider.of<CurrentBarCubit>(context).state.solfaEditingController.insertNotes([
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
    BlocProvider.of<CurrentBarCubit>(context).addNewBar();
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
