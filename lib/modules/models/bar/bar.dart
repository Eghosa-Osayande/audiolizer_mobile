import 'dart:collection';

import 'package:audiolizer/modules/pdf/utils/pdf_font_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:midi_util/midi_util.dart';
import 'package:result_type/result_type.dart';
import 'package:audiolizer/modules/models/notes/enums/solfege.dart';
import 'package:audiolizer/modules/models/notes/note.dart';
import 'package:audiolizer/modules/models/track/track.dart';
import 'package:pdf/widgets.dart' as pw;

part 'bar.freezed.dart';
part 'bar.g.dart';

mixin ErrorObjectMixin<T> {
  T? errorObj;
  int? errorIndex;
  String errorMessage = '';

  clearErrors() {
    errorObj = null;
    errorIndex = null;
    errorMessage = '';
  }
}

@unfreezed
class Bar extends LinkedListEntry<Bar> with _$Bar, ChangeNotifier, ErrorObjectMixin<Note> {
  Bar._();
  @JsonSerializable(explicitToJson: true)
  factory Bar({
    required DateTime createdAt,
    required List<Note> notes,
    @Default('') String lyrics,
    @Default(0) double duration,
  }) = Bard;

  factory Bar.fromJson(Map<String, dynamic> json) => _$BarFromJson(json);

  double? startAtInSeconds() {
    if (notes.isNotEmpty) {
      var startAtInSeconds2 = notes.first.startAtInSeconds;
      if (startAtInSeconds2 != null) {
        return startAtInSeconds2 - .5;
      }
    }
  }

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

    clearErrors();

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
            errorMessage = "${note.displayString()} should come after a duration marker such as : , . |";
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
                  errorMessage = "No previous note found to sustain";
                  break;
                } else {
                  if (previousNote.duration == null) {
                    errorObj = mid;
                    errorMessage = "No previous note found to sustain";
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
              errorMessage = "${start.displayString()}__${end.displayString()} is an invalid time duration";
              break;
            }
          } else {
            errorMessage = "${note.displayString()} should come after a duration marker such as : , . |";
            errorObj = note;
            break;
          }
        } else {
          errorObj = note;
          errorMessage = 'Syntax error';
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

  pw.Widget toPDF() {
    var noteList = notes.map((note) => note.toPDF()).toList();
    switch ((this.list as Track).trackMode) {
      case TrackMode.music:
        return pw.Row(
          mainAxisSize: pw.MainAxisSize.min,
          children: noteList.isEmpty
              ? [
                  pw.Opacity(
                    opacity: 0,
                    child: Note.music(octave: 0, solfa: Solfege.silent, createdAt: DateTime.now()).toPDF(),
                  ),
                ]
              : noteList,
        );

      case TrackMode.lyrics:
        return pw.Container(
         
          child: pw.Row(
            mainAxisSize: pw.MainAxisSize.min,
            children: [
              pw.SizedBox(width:10),
              lyrics.isEmpty
                  ? pw.Opacity(
                      opacity: 0,
                      child: pw.Text('lyrics',
                          style: pw.TextStyle(
                            font: PdfFontProvider.lyrics,
                          )),
                    )
                  : pw.Text(lyrics),
            ],
          ),
        );
    }
  }
}
