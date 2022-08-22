import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:result_type/result_type.dart';
import 'package:solpha/modules/exceptions/exceptions.dart';
import 'package:solpha/modules/models/midi_actions/add_note.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';
import 'package:solpha/modules/models/track/track.dart';

part 'duration_note.dart';
part 'music_note.dart';

class NoteChangeNotifierMixin extends ChangeNotifier {
  GenericException? _error;

  setError(GenericException error) {
    _error = error;
  }

  clearError() {
    _error = null;
  }

  bool get hasError => _error != null;

  String? get errorMessage => _error?.reason;
}

class Note extends NoteChangeNotifierMixin with LinkedListEntry<Note> {
  final Track track;
  Note._(this.track) {
    if (this.list != null) {
      unlink();
    }
    track.add(this);
  }

  factory Note.music(
    Track track, {
    required Solfege solfa,
    required int octave,
  }) {
    return MusicNote(track, solfa: solfa, octave: octave);
  }

  factory Note.duration(
    Track track, {
    required DurationMarker marker,
  }) {
    return DurationNote(track, marker: marker);
  }

  TResult map<TResult extends Object?>({
    required TResult Function(MusicNote musicNote) music,
    required TResult Function(DurationNote durationNote) duration,
  }) {
    if (this is MusicNote) {
      return music.call(this as MusicNote);
    } else {
      return duration.call(this as DurationNote);
    }
  }
}
