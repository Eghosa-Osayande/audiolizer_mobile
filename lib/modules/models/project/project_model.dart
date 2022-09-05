import 'package:audiolizer/modules/common/extensions/list.dart';
import 'package:audiolizer/modules/models/bar/bar.dart';
import 'package:audiolizer/modules/models/track/track.dart';
import 'package:audiolizer/modules/pdf/utils/pdf_font_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:audiolizer/modules/models/score/score.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@unfreezed
class Project with HiveObjectMixin, _$Project {
  Project._();

  @JsonSerializable(explicitToJson: true)
  factory Project({
    required String title,
    required String description,
    required DateTime updatedAt,
    required Score score,
    required List<Score> scoreUndoVersions,
    required List<Score> scoreRedoVersions,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

  String get updatedAtString {
    final DateFormat formatter = DateFormat.jm().add_yMd();
    return '${formatter.format(updatedAt)}';
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
        barColumn.add(track.toList()[index].toPDF());
      }
      pdfBars.add(
       pw.Stack(children: [
        pw.Container(
           margin: pw.EdgeInsets.all(2),
          child:pw.Text('${index + 1}'),
        ),
         pw.Container(
            decoration: pw.BoxDecoration(
              border: pw.Border.all(width: 1),
            ),
            padding: pw.EdgeInsets.fromLTRB(5,4,5,4),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: barColumn,
            ),
          ),
       ])
      );

    });

    return [
      pw.Column(children: [
        pw.Row(
          mainAxisSize: pw.MainAxisSize.max,
          children: [
            pw.Text('${title}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 20)),
            pw.Spacer(),
            pw.Text('Generated with Audiolizer', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 17))
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
    var r = await compute<Map<String, dynamic>, List<pw.Widget>>(_computePDF, this.toJson());

    return r;
  }
}

Future<List<pw.Widget>> _computePDF(Map<String, dynamic> project) async {
  await PdfFontProvider.init();
  return Project.fromJson(project).toPDF();
}
