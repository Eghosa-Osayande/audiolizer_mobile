import 'dart:async';
import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:result_type/result_type.dart';
import 'package:rxdart/rxdart.dart';
import 'package:solpha/modules/exceptions/exceptions.dart';
import 'package:solpha/modules/models/notes/decoration_notes.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/score_editor/cubit/edit_track_notes/edit_history.dart';
import 'package:solpha/modules/models/track/track.dart';

import 'duration_note.dart';
import 'music_note.dart';

mixin ErrorStreamMixin<T> {
  T? _error;
  T? get error => _error;

  BehaviorSubject<T?> _errorController = BehaviorSubject<T?>();
  Stream<T?> get errorStream => _errorController.stream;

  setError(T error) {
    _error = error;
    _errorController.add(error);
    // if (this is Note) {
    //   var errorNote = this as Note;
    //   errorNote.track.setError(errorNote);
    // } else if (this is Track) {
    //   var errorTrack = this as Track;
    //   errorTrack.score.setError(errorTrack);
    // } else if (this is Score) {}
  }

  clearError() {
    _error = null;
    _errorController.add(_error);
    if (this is Note) {
      var errorNote = this as Note;
      errorNote.track.clearError();
    } else if (this is Track) {
      var errorTrack = this as Track;
      errorTrack.score.clearError();
    } else if (this is Score) {}
  }

  bool get hasError => _error != null;
}

extension TrackX on Note {
  Result<bool, GenericException> addToTrack() {
    return track.add(this);
  }
}

class Note with LinkedListEntry<Note>, EquatableMixin, ErrorStreamMixin<GenericException> {
  final Track track;
  final int createdAt = DateTime.now().microsecondsSinceEpoch;

  double? startAt;
  double? endAt;
  double duration = 0;

  Note(this.track);

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
    required TResult Function(Note note) Else,
  }) {
    if (this is MusicNote) {
      return music.call(this as MusicNote);
    } else if (this is DurationNote) {
      return duration.call(this as DurationNote);
    }
    return Else.call(this);
  }

  bool get isDuration => this is DurationNote;
  bool get isMusic => this is MusicNote;

  @override
  // TODO: implement props
  List<Object?> get props => [
        createdAt
      ];

  @override
  void insertAfter(Note entry) {
    if (entry.list != null) {
      entry.unlink();
    }
    if (list != null) {
      this.track.score.hasUpdates = true;
      super.insertAfter(entry);
    }
  }

  @override
  unlink() {
    this.track.score.hasUpdates = true;

    super.unlink();
  }

  Future<void> commit() async {
    num bpm = track.score.intialSettings.bpm;
    if (startAt != null) {
      _startAtInSeconds = (60 / bpm) * (startAt!);
    }
  }

  double? _startAtInSeconds;

  double? startAtInSeconds() {
    if (_startAtInSeconds != null) {
      return (_startAtInSeconds!) - 0.5;
    }
  }

  Note makeCopy([Track? track]) {
    return Note(track??this.track);
  }
}
