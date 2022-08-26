import 'package:equatable/equatable.dart';
import 'package:midi_util/midi_util.dart';
import 'package:solpha/modules/models/score/key_signature.dart';
import 'package:solpha/modules/models/score/time_signature.dart';
import 'package:solpha/modules/models/track/track.dart';

import 'note.dart';

class ScoreConfigNote extends Note {
  final int bpm;
  final TimeSignature timeSignature;
  final KeySignature keySignature;
  final int tonicPitchNumber;

  int? _tonicMidiNumber;

  int get tonicMidiNumber {
    _tonicMidiNumber ??= keySignature.midiNumber + ((tonicPitchNumber - 1) * 12);
    return _tonicMidiNumber!;
  }

  ScoreConfigNote({
    required this.bpm,
    required this.timeSignature,
    required this.keySignature,
    this.tonicPitchNumber = 4,
  });

  @override
  Note makeCopy() {
    throw ScoreConfigNote(
      bpm: bpm,
      timeSignature: timeSignature,
      keySignature: keySignature,
    );
  }

  @override
  String displayString() {
    return '';
  }

  Future<void> commit(
    Track track,
    MIDIFile midiFile,
  ) async {
    super.commit(track, midiFile);

    midiFile.addTempo(
      track: track.trackNumber,
      time: 0,
      tempo: bpm,
    );
    midiFile.addTimeSignature(
      track: track.trackNumber,
      time: 0,
      numerator: timeSignature.numerator,
      denominator: timeSignature.denominator,
      clocks_per_tick: 24,
    );
    midiFile.addKeySignature(
      track: track.trackNumber,
      time: 0,
      no_of_accidentals: keySignature.accidentalCount,
      accidental_mode: keySignature.accidentalMode,
      accidental_type: keySignature.accidentalType,
    );
  }
}

class TrackConfigNote extends Note {
  final int volume;
  final int program;

  TrackConfigNote(this.volume, this.program);

  @override
  Future<void> commit(
    Track track,
    MIDIFile midiFile,
  ) async {
    super.commit(track, midiFile);

    midiFile.addProgramChange(
      tracknum: track.trackNumber,
      channel: track.trackNumber,
      time: 0,
      program: program,
    );
  }

  @override
  Note makeCopy() {
    return TrackConfigNote(volume, program);
  }

  @override
  String displayString() {
    return '';
  }
}
