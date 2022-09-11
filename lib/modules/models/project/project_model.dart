import 'package:audiolizer/modules/common/extensions/list.dart';
import 'package:audiolizer/modules/models/bar/bar.dart';
import 'package:audiolizer/modules/models/track/track.dart';
import 'package:audiolizer/modules/pdf/utils/pdf_font_provider.dart';
import 'package:audiolizer/modules/themes/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:audiolizer/modules/models/score/score.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

part 'project_model.freezed.dart';
// part 'project_model.g.dart';

@unfreezed
class Project with HiveObjectMixin, _$Project {
  Project._();

  // @JsonSerializable(explicitToJson: true)
  factory Project({
    required String title,
    required String description,
    required DateTime updatedAt,
    required Score score,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json['title'] as String,
      description: json['description'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      score: Score.fromJson(json['score'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'description': description,
        'updatedAt': updatedAt.toIso8601String(),
        'score': score.toJson(),
      };

  String get updatedAtString {
    final DateFormat formatter = DateFormat.jm().add_yMd();
    return '${formatter.format(updatedAt)}';
  }

  saveVersion() {
    this.updatedAt = DateTime.now();
    this.save();
  }

  String titleShort(int value, {String delimiter = ''}) {
    return (title.length > value ? title.substring(0, value) + delimiter : title);
  }

  List<pw.Widget> toPDF() {
    var noOfBars = score.ensureUniformTracksLength();
    List<pw.Widget> pdfBars = [];

    List.generate(noOfBars, (index) {
      List<pw.Widget> barColumn = [];
      for (Track track in score) {
        if (track.isVisible) {
          barColumn.add(track.toList()[index].toPDF());
        }
      }
      pdfBars.add(
        pw.Container(
          decoration: pw.BoxDecoration(
            border: pw.Border.all(
              width: 0.5,
              color: PdfColors.black.shade(0.4),
            ),
          ),
          padding: pw.EdgeInsets.fromLTRB(5, 1, 5, 4),
          child: pw.Column(
            mainAxisSize: pw.MainAxisSize.min,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('${index + 1}', style: pw.TextStyle(fontSize: 8)),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: barColumn,
              ),
            ],
          ),
        ),
      );
    });

    return [
      pw.Column(children: [
        pw.Row(
          mainAxisSize: pw.MainAxisSize.max,
          children: [
            pw.Text('${title}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 20)),
            pw.Spacer(),
            // pw.Row(
            //   crossAxisAlignment: pw.CrossAxisAlignment.end,
            //   children: [
            //     pw.Text(
            //       'Generated with Audiolizer',
            //       style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 17),
            //     ),
            //     pw.SizedBox.square(
            //       dimension: 50,
            //       child: pw.SvgImage(svg: kLogoSvg),
            //     ),
            //   ],
            // )
          ],
        ),
        pw.Row(
          mainAxisSize: pw.MainAxisSize.max,
          children: [
            pw.Text('\nDoh is ${score.keySignature.displayString}, ${score.timeSignature.numerator}/${score.timeSignature.denominator}, ${score.bpm} BPM\n\n')
          ],
        ),
        pw.Row(
          mainAxisSize: pw.MainAxisSize.max,
          children: [
            pw.Text(
              '${description.trim()}\n\n',
              style: pw.TextStyle(fontStyle: pw.FontStyle.italic),
            )
          ],
        ),
      ]),
      ...pdfBars,
    ];
  }

  Future<List<pw.Widget>> toPDFAsync() async {
    // var r = await compute<Map<String, dynamic>, List<pw.Widget>>(_computePDF, this.toJson());

    var r = await _computePDF(toJson());
    return r;
  }
}

Future<List<pw.Widget>> _computePDF(Map<String, dynamic> project) async {
  return Project.fromJson(project).toPDF();
}
