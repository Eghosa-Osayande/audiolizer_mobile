// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/notes/decoration_notes.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/score_editor/cubit/edit_track_notes/edit_track_note_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/edit_track_notes/edit_track_note_cubit.dart';

class NoteKeyModel {
  const NoteKeyModel();

  String displayString() {
    return '';
  }

  Widget? icon() {}

  void action(BuildContext context) {}
}

class MusicNoteButton implements NoteKeyModel {
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
    var track = context.read<EditTrackNotesCubit>().track;
    var newNote = Note.music(track, solfa: solfa, octave: octave);
    context.read<EditTrackNotesCubit>().addNote(newNote);
  }

  @override
  Widget? icon() {}
}

class DurationNoteButton implements NoteKeyModel {
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
    var track = context.read<EditTrackNotesCubit>().track;
    var newNote = Note.duration(track, marker: marker);
    context.read<EditTrackNotesCubit>().addNote(newNote);
  }

  @override
  Widget? icon() {}
}

class DeleteNoteButton implements NoteKeyModel {
  const DeleteNoteButton();

  @override
  String displayString() {
    return "⇐";
  }

  @override
  void action(BuildContext context) {
    context.read<EditTrackNotesCubit>().deleteNote();
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

class SpaceBarButton implements NoteKeyModel {
  const SpaceBarButton();

  @override
  String displayString() {
    return '';
  }

  @override
  void action(BuildContext context) {
    var track = context.read<EditTrackNotesCubit>().track;
    var newNote = SpacingNote(track, NoteSpacing.whiteSpace);
    context.read<EditTrackNotesCubit>().addNote(newNote);
  }

  @override
  Widget? icon() {}
}

class NewLineButton implements NoteKeyModel {
  const NewLineButton();

  @override
  String displayString() {
    return '↵';
  }

  @override
  void action(BuildContext context) {
    var track = context.read<EditTrackNotesCubit>().track;
    var newNote = SpacingNote(track, NoteSpacing.newLine);
    context.read<EditTrackNotesCubit>().addNote(newNote);
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
