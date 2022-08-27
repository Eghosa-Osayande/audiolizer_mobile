import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:midi_util/midi_util.dart';
import 'package:result_type/result_type.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/score_editor/ui/widgets/solfa_text_field/solfa_input_controller.dart';

import '../bar/bars_linked_list.dart';

part 'track.freezed.dart';
part 'track.g.dart';

typedef Bars = Map<int, SolfaEditingController>;

List<Bar> linkedListToJson(BarsLinkedlist value) {
  return value.toList();
}

BarsLinkedlist linkedListfromJson(dynamic value) {
  List<Bar> list = List.from(value.map((e)=>Bar.fromJson(e)).toList());
  return BarsLinkedlist(list);
}

@unfreezed
class Track with _$Track {
  const Track._();

  @JsonSerializable(explicitToJson: true)
  factory Track({
    required int trackNumber,
    required int volume,
    required int program,
    @JsonKey(toJson: linkedListToJson, fromJson: linkedListfromJson) required BarsLinkedlist bars,
    required ScoreConfigNote intialScoreConfigNote,
  }) = _Track;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

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
      bars: BarsLinkedlist(),
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

  Result<bool, int> computeNotes() {
    int count = 0;
    double accumulatedTime = 0;

    for (var bar in bars) {
      var result = bar.computeNotes(
        intialScoreConfigNoteX: intialScoreConfigNote,
        intialTrackConfigNoteX: intialTrackConfigNote,
        accumulatedTime: accumulatedTime,
      );
      if (result.isFailure) {
        return Failure(count);
      } else {
        accumulatedTime = result.success;
      }
      count = count + 1;
    }
    return Success(true);
  }

  Result<bool, Note> computeNote() {
    double accumulatedTime = 0;
    DurationNote? start, end;
    MusicNote? previousNote, mid;

    Note? errorNote;

    for (var note in notesForCommit) {
      note.intialScoreConfigNote = intialScoreConfigNote;
      note.intialTrackConfigNote = intialTrackConfigNote;
      if ((note.isDuration) || (note.isMusic)) {
        if (start == null) {
          if (note.isDuration) {
            start = note as DurationNote;
            continue;
          } else {
            errorNote = note;
            break;
          }
        } else if (mid == null) {
          if (note.isMusic) {
            mid = note as MusicNote;
            continue;
          } else {
            errorNote = note;
            break;
          }
        } else if (end == null) {
          if (note.isDuration) {
            end = note as DurationNote;
            //
            var result = start.beatsBetween(end);
            if (result.isSuccess) {
              double duration = result.success;
              mid.startAt = accumulatedTime;
              start.startAt = accumulatedTime;
              end.startAt = accumulatedTime;
              accumulatedTime = accumulatedTime + duration;
              mid.endAt = accumulatedTime;
              start.endAt = accumulatedTime;
              end.endAt = accumulatedTime;

              if (mid.isSustained) {
                if (previousNote == null) {
                  errorNote = mid;
                  break;
                } else {
                  if (previousNote.duration == null) {
                    errorNote = mid;
                    break;
                  } else {
                    previousNote.duration = previousNote.duration + duration;
                    mid.duration = 0;
                  }
                }
              } else {
                mid.duration = duration;
                previousNote = mid;
              }

              mid = null;
              start = end;
              end = null;
            } else {
              errorNote = mid;
              break;
            }
          } else {
            errorNote = note;
            break;
          }
        } else {
          errorNote = note;
          break;
        }
      }
    }

    if (errorNote != null) {
      return Failure(errorNote);
    } else {
      return Success(true);
    }
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
