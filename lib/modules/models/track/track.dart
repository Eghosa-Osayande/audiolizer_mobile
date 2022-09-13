import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:midi_util/midi_util.dart';
import 'package:result_type/result_type.dart';
import 'package:audiolizer/modules/models/bar/bar.dart';
import 'package:audiolizer/modules/models/notes/enums/duration_markers.dart';
import 'package:audiolizer/modules/models/notes/enums/solfege.dart';
import 'package:audiolizer/modules/models/notes/note.dart';
import 'package:audiolizer/modules/models/score/score.dart';
import 'package:audiolizer/modules/models/track/enums/midi_program.dart';

import 'dart:collection';

part 'track.freezed.dart';
// part 'track.g.dart';

enum TrackMode {
  music,
  lyrics;
}

@unfreezed
class Track extends LinkedList<Bar> with _$Track, LinkedListEntry<Track>, EquatableMixin, ErrorObjectMixin<Bar> {
  Track._();

  factory Track({
    required int trackNumber,
    required int volume,
    required MidiProgram program,
    required String name,
    MusicNote? previousNote,
    @Default(TrackMode.music) TrackMode trackMode,
    @Default(true) bool isVisible,
    @Default(true) bool isLyricsVisible,
  }) = _Track;

  // factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  factory Track.fromJson(Map<String, dynamic> json) {
    var track = Track(
      trackNumber: json['trackNumber'] as int,
      volume: json['volume'] as int,
      program: MidiProgram.getProgram(json['program'] as int),
      name: json['name'] as String,
      isVisible: json['isVisible'] ?? true,
      isLyricsVisible: json['isLyricsVisible'] ?? true,
      trackMode: TrackMode.values[(json['trackMode'] as int?) ?? TrackMode.music.index],
    );
    List<Bar> bars = List.from(
      (json['bars'] as List).map((e) => Bar.fromJson(e)).toList(),
    );
    track.addAll(bars);
    return track;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'trackNumber': trackNumber,
        'volume': volume,
        'program': program.value,
        'bars': this.toList().map((bar) => bar.toJson()).toList(),
        'isVisible': isVisible,
        'isLyricsVisible': isLyricsVisible,
        'trackMode': trackMode.index,
      };

  LinkedList<Bar> get bars => this;

  Score get score => this.list as Score;

  List<Note> get notes => [
        ...(bars.fold<List<Note>>(
          [],
          (previousValue, bar) => previousValue
            ..addAll(
              bar.notes,
            ),
        ))
      ];

  double get trackLengthInBeats {
    if (notes.isNotEmpty) {
      return notes.last.endAt ?? 0;
    }
    return 0;
  }

  

  Result<bool, Bar> computeNotes() {
    int count = 0;
    double accumulatedTime = 0;

    errorObj = null;
    errorIndex = null;
    previousNote = null;

    int index = 0;

    for (var bar in bars) {
      errorIndex = index;
      index++;
      var result = bar.computeNotes(
        accumulatedTime: accumulatedTime,
      );
      if (result.isFailure) {
        errorObj = bar;
        return Failure(bar);
      } else {
        accumulatedTime = result.success;
      }
      count = count + 1;
    }
    return Success(true);
  }

  resetAllNotes() {
    for (var bar in bars) {
      for (var note in bar.notes) {
        note.startAt = note.endAt = note.endAtInSeconds = note.startAtInSeconds = null;
      }
    }
  }

  Result<double, Bar> computeBar(
    Bar bar, {
    required double accumulatedTime,
    required int barGroupIndex,
  }) {
    errorObj = null;
    errorIndex = null;

    errorIndex = barGroupIndex;

    var result = bar.computeNotes(
      accumulatedTime: accumulatedTime,
    );
    if (result.isFailure) {
      errorObj = bar;
      return Failure(bar);
    } else {
      accumulatedTime = result.success;
      return Success(accumulatedTime);
    }
  }

  Future<void> commit(MIDIFile midiFile, {bool isMetroneme = false}) async {
    switch (trackMode) {
      case TrackMode.lyrics:
        return;
      case TrackMode.music:
        break;
    }
    midiFile.addTempo(
      track: trackNumber,
      time: 0,
      tempo: score.bpm,
    );
    midiFile.addTimeSignature(
      track: trackNumber,
      time: 0,
      numerator: score.timeSignature.numerator,
      denominator: score.timeSignature.denominator,
      clocks_per_tick: 24,
    );
    // TODO: actual implementation of keys Signature
    // midiFile.addKeySignature(
    //   track: trackNumber,
    //   time: 0,
    //   no_of_accidentals: score.keySignature.accidentalCount,
    //   accidental_mode: score.keySignature.accidentalMode,
    //   accidental_type: score.keySignature.accidentalType,
    // );
    if (isMetroneme) {
      midiFile.addProgramChange(
        tracknum: trackNumber,
        channel: trackNumber,
        time: 0,
        program: 45,
      );
    } else {
      midiFile.addProgramChange(
        tracknum: trackNumber,
        channel: trackNumber,
        time: 0,
        program: program.value,
      );
    }

    for (var bar in bars) {
      await bar.commit(this, midiFile, isMetroneme: isMetroneme);
    }
  }

  Future<void> commitBar(MIDIFile midiFile, Bar bar, {bool isMetroneme = false}) async {
    switch (trackMode) {
      case TrackMode.lyrics:
        return;
      case TrackMode.music:
        break;
    }
    midiFile.addTempo(
      track: trackNumber,
      time: 0,
      tempo: score.bpm,
    );
    midiFile.addTimeSignature(
      track: trackNumber,
      time: 0,
      numerator: score.timeSignature.numerator,
      denominator: score.timeSignature.denominator,
      clocks_per_tick: 24,
    );
    // TODO: actual implementation of keys Signature
    // midiFile.addKeySignature(
    //   track: trackNumber,
    //   time: 0,
    //   no_of_accidentals: score.keySignature.accidentalCount,
    //   accidental_mode: score.keySignature.accidentalMode,
    //   accidental_type: score.keySignature.accidentalType,
    // );
    if (isMetroneme) {
      midiFile.addProgramChange(
        tracknum: trackNumber,
        channel: trackNumber,
        time: 0,
        program: 45,
      );
    } else {
      midiFile.addProgramChange(
        tracknum: trackNumber,
        channel: trackNumber,
        time: 0,
        program: program.value,
      );
    }

    await bar.commit(this, midiFile, isMetroneme: isMetroneme);
  }

  @override
  List<Object?> get props => [];
  @override
  bool? get stringify => true;
}
