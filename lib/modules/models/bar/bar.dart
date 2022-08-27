import 'dart:collection';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:midi_util/midi_util.dart';
import 'package:result_type/result_type.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/track/track.dart';
import 'package:solpha/modules/score_editor/ui/widgets/solfa_text_field/solfa_input_controller.dart';

part 'bar.freezed.dart';
part 'bar.g.dart';

List<Note> solfaEditingControllerToJson(SolfaEditingController value) {
  return value.notes;
}

SolfaEditingController solfaEditingControllerFromJson(dynamic value) {
    List<Note> list = List.from(value.map((e)=>Note.fromJson(e)).toList());
  return SolfaEditingController()..notes.addAll(list);
}

@unfreezed
class Bar extends LinkedListEntry<Bar> with _$Bar {
  Bar._();
  @JsonSerializable(explicitToJson: true)
  factory Bar({
    required DateTime createdAt,
    @JsonKey(toJson: solfaEditingControllerToJson, fromJson: solfaEditingControllerFromJson) required SolfaEditingController solfaEditingController,
    @Default('') String lyrics,
    double? startAt,
    double? endAt,
    @Default(0) double duration,
    ScoreConfigNote? intialScoreConfigNote,
    TrackConfigNote? intialTrackConfigNote,
  }) = Bard;

  factory Bar.fromJson(Map<String, dynamic> json) => _$BarFromJson(json);

  double get trackLengthInBeats {
    if (notes.isNotEmpty) {
      return notes.last.endAt ?? 0;
    }
    return 0;
  }

  List<Note> get notes => solfaEditingController.notes;

  List<Note> get notesForCommit => [
        intialScoreConfigNote!,
        intialTrackConfigNote!,
        ...solfaEditingController.notes
      ];

  Result<double, Note> computeNotes({
    required ScoreConfigNote intialScoreConfigNoteX,
    required TrackConfigNote intialTrackConfigNoteX,
    required double accumulatedTime,
  }) {
    intialScoreConfigNote = intialScoreConfigNoteX;
    intialTrackConfigNote = intialTrackConfigNoteX;

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
      return Success(accumulatedTime);
    }
  }

  Future<void> commit(Track track, MIDIFile midiFile) async {
    for (var note in notesForCommit) {
      await note.commit(track, midiFile);
    }
  }
}
