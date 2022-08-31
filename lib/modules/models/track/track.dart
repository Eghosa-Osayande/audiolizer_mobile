import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:midi_util/midi_util.dart';
import 'package:result_type/result_type.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/score_editor/ui/widgets/solfa_text_field/solfa_input_controller.dart';
import 'dart:collection';

import '../bar/bars_linked_list.dart';

part 'track.freezed.dart';
// part 'track.g.dart';



@unfreezed
class Track extends LinkedList<Bar> with _$Track {
   Track._();

  factory Track({
    required int trackNumber,
    required int volume,
    required int program,
    required ScoreConfigNote intialScoreConfigNote,
  }) = _Track;

  // factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  factory Track.fromJson(Map<String, dynamic> json) {
    var track = Track(
      trackNumber: json['trackNumber'] as int,
      volume: json['volume'] as int,
      program: json['program'] as int,
      intialScoreConfigNote: ScoreConfigNote.fromJson(json['intialScoreConfigNote'] as Map<String, dynamic>),
    );
    List<Bar> bars = List.from((json['bars'] as List).map((e) => Bar.fromJson(e)).toList() );
    track.addAll(bars);
    return track;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'trackNumber': trackNumber,
        'volume': volume,
        'program': program,
        'bars': this.toList(),
        'intialScoreConfigNote': intialScoreConfigNote.toJson(),
      };

  LinkedList<Bar> get bars => this;

  TrackConfigNote get intialTrackConfigNote => TrackConfigNote(
        volume,
        program,
        createdAt: DateTime.now().toUtc(),
      );

  List<Note> get notes => [
        ...(bars.fold<List<Note>>(
          [],
          (previousValue, bar) => previousValue
            ..addAll(
              bar.notes,
            ),
        ))
      ];

  List<Note> get notesForCommit => [
        intialScoreConfigNote,
        intialTrackConfigNote,
        ...notes
      ];

  double get trackLengthInBeats {
    if (notes.isNotEmpty) {
      return notes.last.endAt ?? 0;
    }
    return 0;
  }

  void addMetronemeTrack(MIDIFile midiFile) {
    var metro = Track(
      trackNumber: 5,
      program: 115,
      volume: 100,
      intialScoreConfigNote: intialScoreConfigNote,
    
    );
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
        intialScoreConfigNoteX: intialScoreConfigNote,
        intialTrackConfigNoteX: intialTrackConfigNote,
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
    for (var bar in bars) {
      await bar.commit(this, midiFile);
    }
    // for (var note in notesForCommit) {
    //   await note.commit(this, midiFile);
    // }
  }
}
