// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';
import 'package:solpha/modules/score_editor/cubit/track/track_cubit.dart';

class NoteKeyModel {
  const NoteKeyModel();

  String displayString() {
    return '';
  }

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
    context.read<TrackCubit>().addMusicNote(this);
  }
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
    context.read<TrackCubit>().addDurationNote(this);
  }
}

class DeleteNoteButton implements NoteKeyModel {
  const DeleteNoteButton();

  @override
  String displayString() {
    return 'DEL';
  }

  @override
  void action(BuildContext context) {
    context.read<TrackCubit>().deleteNote();
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
   context.read<TrackCubit>().addSpace();
  }
}

class NewLineButton implements NoteKeyModel {
  const NewLineButton();

  @override
  String displayString() {
    return 'NEW';
  }

  @override
  void action(BuildContext context) {
    context.read<TrackCubit>().addNewLine();
  }
}
