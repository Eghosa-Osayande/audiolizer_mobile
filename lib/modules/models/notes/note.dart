import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:midi_util/midi_util.dart';
import 'package:rxdart/rxdart.dart';
import 'package:solpha/modules/exceptions/exceptions.dart';
import 'package:solpha/modules/models/notes/config_notes.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';
import 'package:solpha/modules/models/track/track.dart';

import 'duration_note.dart';
import 'music_note.dart';

abstract class Note implements EquatableMixin {
  final int createdAt = DateTime.now().microsecondsSinceEpoch;

  double? startAt;
  double? endAt;
  double duration = 0;
  ScoreConfigNote? intialScoreConfigNote;
  TrackConfigNote? intialTrackConfigNote;

  Note();

  factory Note.music({
    required Solfege solfa,
    required int octave,
  }) {
    return MusicNote(solfa: solfa, octave: octave);
  }

  factory Note.duration({
    required DurationMarker marker,
  }) {
    return DurationNote(marker: marker);
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
  List<Object?> get props => [
        createdAt
      ];

  @override
  bool? get stringify => true;

  Future<void> commit(
    Track track,
    MIDIFile midiFile,
  ) async {
    num bpm = intialScoreConfigNote!.bpm;
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

  Note makeCopy();
  String displayString();
}
