import 'dart:async';

import 'package:audiolizer/modules/exceptions/exceptions.dart';
import 'package:audiolizer/modules/models/notes/enums/duration_markers.dart';
import 'package:audiolizer/modules/models/notes/enums/solfege.dart';
import 'package:audiolizer/modules/models/track/track.dart';
import 'package:audiolizer/modules/pdf/utils/pdf_font_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:midi_util/midi_util.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:result_type/result_type.dart';

part 'extensions/duration_note_x.dart';
part 'extensions/music_note_x.dart';
part 'extensions/white_space_note_x.dart';
part 'note.freezed.dart';
part 'note.g.dart';

@unfreezed
abstract class Note with _$Note, EquatableMixin {
  @JsonSerializable(explicitToJson: true)
  const Note._();

  @JsonSerializable(explicitToJson: true)
  factory Note.music({
    required Solfege solfa,
    required int octave,
    required DateTime createdAt,
    double? startAt,
    double? endAt,
    @Default(0) double duration,
    double? startAtInSeconds,
    double? endAtInSeconds,
  }) = MusicNote;

  @JsonSerializable(explicitToJson: true)
  factory Note.duration({
    required DurationMarker marker,
    required DateTime createdAt,
    double? startAt,
    double? endAt,
    @Default(0) double duration,
    double? startAtInSeconds,
    double? endAtInSeconds,
  }) = DurationNote;

  @JsonSerializable(explicitToJson: true)
  factory Note.whiteSpace({
    required DateTime createdAt,
    double? startAt,
    double? endAt,
    @Default(0) double duration,
    double? startAtInSeconds,
    double? endAtInSeconds,
  }) = WhiteSpaceNote;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  bool get isDuration => this is DurationNote;
  bool get isMusic => this is MusicNote;

  Future<void> commit(Track track, MIDIFile midiFile, {bool isMetroneme = false}) async {
    map(
      music: (music) {
        music._commitX(track, midiFile, isMetroneme: isMetroneme);
      },
      duration: (duration) {},
      whiteSpace: (whiteSpace) {},
    );
    num bpm = track.score.bpm;
    if (startAt != null) {
      startAtInSeconds = ((60 / bpm) * (startAt!));
    }
    if(endAt!=null){
      endAtInSeconds = ((60 / bpm) * (endAt!));
    }
  }

  Note makeCopy() {
    return map<Note>(
      music: (music) {
        return music._makeCopyX();
      },
      duration: (duration) {
        return duration._makeCopyX();
      },
      whiteSpace: (whiteSpace) {
        return whiteSpace._makeCopyX();
      },
    );
  }

  String displayString() {
    return map<String>(
      music: (music) {
        return music._displayStringX();
      },
      duration: (duration) {
        return duration._displayStringX();
      },
      whiteSpace: (whiteSpace) {
        return whiteSpace._displayStringX();
      },
    );
  }

  String pdfString() {
    return map<String>(
      music: (music) {
        return displayString();
      },
      duration: (duration) {
        return displayString();
      },
      whiteSpace: (whiteSpace) {
        return ' ';
      },
    );
  }

  pw.Widget toPDF() {
    pw.Font font = map<pw.Font>(
      music: (music) {
        return PdfFontProvider.musicFont;
      },
      duration: (duration) {
        return PdfFontProvider.durationFont;
      },
      whiteSpace: (whiteSpace) {
        return PdfFontProvider.musicFont;
      },
    );
    var r = pw.Text(
      pdfString(),
      style: pw.TextStyle(
        font: font,
        fontSize: map(
          music: (music) {
            return 12.0;
          },
          duration: (duration) {
            return 13.0;
          },
          whiteSpace: (whiteSpace) {
            return 12.0;
          },
        ),
        fontWeight: map(
          music: (music) {
            return pw.FontWeight.normal;
          },
          duration: (duration) {
            return pw.FontWeight.bold;
          },
          whiteSpace: (whiteSpace) {
            return pw.FontWeight.normal;
          },
        ),
        fontFallback: [
          PdfFontProvider.fallback
        ],
      ),
    );
    return map(
      music: (value) => r,
      duration: (value) => pw.Container(
        margin: pw.EdgeInsets.symmetric(
          horizontal: 1,
        ),
        child: pw.Center(
          child: r,
        ),
      ),
      whiteSpace: (value) => pw.SizedBox(width: 10),
    );
  }

  @override
  List<Object?> get props => [
        createdAt
      ];
}
