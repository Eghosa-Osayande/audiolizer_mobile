import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:midi_util/midi_util.dart';
import 'package:result_type/result_type.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/track/track.dart';

part 'bar.freezed.dart';
part 'bar.g.dart';

mixin ErrorObjectMixin<T> {
  T? errorObj;
  int? errorIndex;
}

@unfreezed
class Bar extends LinkedListEntry<Bar> with _$Bar, ChangeNotifier, ErrorObjectMixin<Note> {
  Bar._();
  @JsonSerializable(explicitToJson: true)
  factory Bar({
    required DateTime createdAt,
    required List<Note> notes,
    @Default('') String lyrics,
    double? startAt,
    double? endAt,
    @Default(0) double duration,
  }) = Bard;

  factory Bar.fromJson(Map<String, dynamic> json) => _$BarFromJson(json);

  double get trackLengthInBeats {
    if (notes.isNotEmpty) {
      return notes.last.endAt ?? 0;
    }
    return 0;
  }

  Result<double, Note> computeNotes({
    required double accumulatedTime,
  }) {
    // intialScoreConfigNote = intialScoreConfigNoteX;

    DurationNote? start, end;
    MusicNote? previousNote, mid;

    errorObj = null;
    errorIndex = null;
    startAt = null;
    int index = 0;
    for (var note in notes) {
      errorIndex = index;
      index++;
      if ((note.isDuration) || (note.isMusic)) {
        if (start == null) {
          if (note.isDuration) {
            start = note as DurationNote;
            continue;
          } else {
            errorObj = note;
            break;
          }
        } else if (mid == null) {
          if (note.isMusic) {
            mid = note as MusicNote;
            continue;
          } else {
            // errorObj = note;
            // break;
          }
        }
        if (end == null) {
          if (note.isDuration) {
            end = note as DurationNote;

            mid ??= MusicNote(solfa: Solfege.silent, octave: 0, createdAt: DateTime.now());

            //
            startAt ??= start.startAtInSeconds;
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
                  errorObj = mid;
                  break;
                } else {
                  if (previousNote.duration == null) {
                    errorObj = mid;
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
              errorObj = mid;
              break;
            }
          } else {
            errorObj = note;
            break;
          }
        } else {
          errorObj = note;
          break;
        }
      }
    }

    if (errorObj != null) {
      return Failure(errorObj!);
    } else {
      return Success(accumulatedTime);
    }
  }

  Future<void> commit(Track track, MIDIFile midiFile, {bool isMetroneme = false}) async {
    for (var note in notes) {
      await note.commit(track, midiFile, isMetroneme: isMetroneme);
    }
  }
}
