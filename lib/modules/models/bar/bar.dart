import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:midi_util/midi_util.dart';
import 'package:result_type/result_type.dart';
import 'package:solpha/modules/models/notes/config_notes.dart';
import 'package:solpha/modules/models/notes/duration_note.dart';
import 'package:solpha/modules/models/notes/lyrics_note.dart';
import 'package:solpha/modules/models/notes/music_note.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/track/track.dart';
import 'package:solpha/modules/score_editor/ui/widgets/solfa_text_field/solfa_input_controller.dart';

class Bar extends LinkedListEntry<Bar> with EquatableMixin {
  final DateTime createdAt = DateTime.now();
  final SolfaEditingController solfaEditingController = SolfaEditingController();

  List<Note> get notes => solfaEditingController.notes;

  List<Note> get notesForCommit => [
        _intialScoreConfigNote!,
        _intialTrackConfigNote!,
        ...solfaEditingController.notes
      ];

  List<LyricsNote> lyrics = [];

  double? startAt;
  double? endAt;
  double duration = 0;
  ScoreConfigNote? _intialScoreConfigNote;
  TrackConfigNote? _intialTrackConfigNote;

  Bar();

  @override
  List<Object?> get props => [
        createdAt
      ];

  double get trackLengthInBeats {
    if (notes.isNotEmpty) {
      return notes.last.endAt ?? 0;
    }
    return 0;
  }

  Result<double, Note> computeNotes({
    required ScoreConfigNote intialScoreConfigNote,
    required TrackConfigNote intialTrackConfigNote,
    required double accumulatedTime,
  }) {
    _intialScoreConfigNote = intialScoreConfigNote;
    _intialTrackConfigNote = intialTrackConfigNote;

    DurationNote? start, end;
    MusicNote? previousNote, mid;

    Note? errorNote;

    var notesForCommit = [
      intialScoreConfigNote,
      intialTrackConfigNote,
      ...solfaEditingController.notes
    ];
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
