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
import 'package:solpha/modules/models/track/track.dart';

import 'duration_note.dart';
import 'music_note.dart';

mixin ErrorStreamMixin<T> on ChangeNotifier {
  T? _error;
  T? get error => _error;

  setError(T error) {
    _error = error;
    notifyListeners();
  }

  clearError() {
    _error = null;
    notifyListeners();
  }

  bool get hasError => _error != null;
}

extension TrackX on Note {
  Result<bool, GenericException> addToTrack() {
    return track.add(this);
  }
}

class Note with LinkedListEntry<Note>, EquatableMixin, ChangeNotifier, ErrorStreamMixin<GenericException> {
  final Track track;
  final int createdAt = DateTime.now().microsecondsSinceEpoch;

  double? position;

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
      super.insertAfter(entry);
    }
  }

  Future<void> commit() async {}
}
