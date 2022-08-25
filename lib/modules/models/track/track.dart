import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:result_type/result_type.dart';
import 'package:solpha/modules/exceptions/exceptions.dart';
import 'package:solpha/modules/models/midi_actions/add_key_signature.dart';
import 'package:solpha/modules/models/midi_actions/add_program_change.dart';
import 'package:solpha/modules/models/midi_actions/add_tempo.dart';
import 'package:solpha/modules/models/midi_actions/add_time_signature.dart';
import 'package:solpha/modules/models/notes/duration_note.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';
import 'package:solpha/modules/models/notes/music_note.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/score_editor/cubit/edit_track_notes/edit_history.dart';

class Track extends LinkedList<Note> with ErrorStreamMixin<Note> {
  
  final Score score;
  final int trackNumber;
  final int volume;
  final int program;
  
 

  Track({
    required this.score,
    required this.trackNumber,
    required this.program,
    required this.volume,
  });

  @override
  Result<bool, GenericException> add(Note entry) {
    if (entry.list != null) {
      entry.unlink();
    }
    super.add(entry);
    this.score.hasUpdates = true;
   
    return Success(true);
  }

  void addStartSeperator() {
    add(Note.duration(this, marker: DurationMarker.seperator));
  }

  double get trackLengthInBeats {
    if (isNotEmpty) {
      return last.endAt ?? 0;
    }
    return 0;
  }

  void addMetronemeTrack() {
    var metro = Track(
      score: this.score,
      trackNumber: 5,
      program: 115,
      volume: 100,
    );
    metro.add(Note.duration(metro, marker: DurationMarker.full));
    List.generate(trackLengthInBeats.ceil(), (index) {
      metro.add(Note.music(metro, solfa: Solfege.d, octave: 0));
      metro.add(Note.duration(metro, marker: DurationMarker.full));
    });
    metro.computeNotes();
    metro.commit();
  }

  Result<bool, Note> computeNotes() {
    double accumulatedTime = 0;
    DurationNote? start, end;
    MusicNote? previousNote, mid;
    clearError();
    Note? errorNote;
    print(this.length);

    for (var note in this) {
      note.clearError();
      if ((note.isDuration) || (note.isMusic)) {
        if (start == null) {
          if (note.isDuration) {
            start = note as DurationNote;
            continue;
          } else {
            note.setError(GenericException('Start'));
            errorNote = note;
            break;
          }
        } else if (mid == null) {
          if (note.isMusic) {
            mid = note as MusicNote;
            continue;
          } else {
            note.setError(GenericException('mid'));
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
                  mid.setError(GenericException('Invalid suspension'));
                  errorNote = mid;
                  break;
                } else {
                  if (previousNote.duration == null) {
                    mid.setError(GenericException('Invalid suspension 2'));
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
              start.setError(result.failure);
              errorNote = mid;
              break;
            }
          } else {
            note.setError(GenericException('End'));
            errorNote = note;
            break;
          }
        } else {
          note.setError(GenericException('Abrupt'));
          errorNote = note;
          break;
        }
      }
    }
    print([
      'oooo',
      errorNote?.error?.reason
    ]);
    if (errorNote != null) {
      setError(errorNote);
      return Failure(errorNote);
    } else {
      return Success(true);
    }
  }

  Future<void> commit() async {
    var midiFile = score.midiFile;
    var timeSignature = score.intialSettings.timeSignature;
    var keySignature = score.intialSettings.keySignature;

    AddTempo(track: this, tempo: score.intialSettings.bpm).run(midiFile);
    AddProgramChange(track: this, program: program).run(midiFile);
    AddTimeSignature(track: this, timeSignature: timeSignature).run(midiFile);
    AddKeySignature(track: this, keySignature: keySignature).run(midiFile);

    for (var note in this) {
      await note.commit();
    }
  }
}
