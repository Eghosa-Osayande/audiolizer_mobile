import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:midi_util/midi_util.dart';
import 'package:result_type/result_type.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/models/track/enums/midi_program.dart';

import 'dart:collection';



part 'track.freezed.dart';
// part 'track.g.dart';

@unfreezed
class Track extends LinkedList<Bar> with _$Track, LinkedListEntry<Track>, EquatableMixin {
  Track._();

  factory Track({
    required int trackNumber,
    required int volume,
    required MidiProgram program,
    required String name,
  }) = _Track;

  // factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  factory Track.fromJson(Map<String, dynamic> json) {
    var track = Track(
      trackNumber: json['trackNumber'] as int,
      volume: json['volume'] as int,
      program: MidiProgram.values[json['program'] as int],
      name: json['name'] as String,
    );
    List<Bar> bars = List.from((json['bars'] as List).map((e) => Bar.fromJson(e)).toList());
    track.addAll(bars);
    return track;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'trackNumber': trackNumber,
        'volume': volume,
        'program': program.index,
        'bars': this.toList().map((bar) => bar.toJson()).toList(),
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

  void addMetronemeTrack(MIDIFile midiFile) {
    var metro = Track(trackNumber: 5, program: MidiProgram.gong, volume: 100, name: 'met');
    metro.notes.add(
      DurationNote(
        marker: DurationMarker.full,
        createdAt: DateTime.now().toUtc(),
      ),
    );
    List.generate(trackLengthInBeats.ceil(), (index) {
      metro.notes.add(
        MusicNote(
          solfa: Solfege.d,
          octave: 0,
          createdAt: DateTime.now().toUtc(),
        ),
      );
      metro.notes.add(
        DurationNote(
          marker: DurationMarker.full,
          createdAt: DateTime.now().toUtc(),
        ),
      );
    });
    metro.computeNotes();
    metro.commit(midiFile);
  }

  Result<bool, Bar> computeNotes() {
    int count = 0;
    double accumulatedTime = 0;

    for (var bar in bars) {
      var result = bar.computeNotes(
        accumulatedTime: accumulatedTime,
      );
      if (result.isFailure) {
        return Failure(bar);
      } else {
        accumulatedTime = result.success;
      }
      count = count + 1;
    }
    return Success(true);
  }

  Future<void> commit(MIDIFile midiFile) async {
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
    midiFile.addKeySignature(
      track: trackNumber,
      time: 0,
      no_of_accidentals: score.keySignature.accidentalCount,
      accidental_mode: score.keySignature.accidentalMode,
      accidental_type: score.keySignature.accidentalType,
    );
    midiFile.addProgramChange(
      tracknum: trackNumber,
      channel: trackNumber,
      time: 0,
      program: program.value,
    );
   
    for (var bar in bars) {
      await bar.commit(this, midiFile);
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
  @override
  bool? get stringify => true;
}
