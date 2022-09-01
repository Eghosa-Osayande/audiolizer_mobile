import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ScorePdfPreview extends StatelessWidget {
  const ScorePdfPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PdfPreview(
        canDebug: false,
        allowPrinting: true,
        dynamicLayout: false,
        padding: EdgeInsets.zero,
        onPrinted: (context) {},
        onPrintError: (context, error) {},
        onShared: (context) {},
        build: (format) {
          var a = pw.Wrap(
            children: List.generate(
              92,
              (index) {
                return pw.Container(
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(width: 2),
                  ),
                  padding: pw.EdgeInsets.all(10),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: index.remainder(3) != 0
                        ? [
                            pw.Text('${index + 1}'),
                            pw.Text('d.d:d.d:d.d:d.d:'),
                            pw.Text('d:r:m:d'),
                            pw.Text('d:r:m:d'),
                            pw.Text('d:r:m:d'),
                          ]
                        : index.remainder(7) != 0
                            ? [
                                pw.Text('${index + 1}'),
                                pw.Text('d.d:d.d:d.d:d.d:'),
                                pw.Text('d:r:m:d'),
                                pw.Text('d:r:m:d'),
                                pw.Text('d,r.d:d.d:d.d:r,.d:'),
                              ]
                            : [
                               pw.Text('${index + 1}'),
                                pw.Text('d:r:m:d'),
                                pw.Text('Hail the star of'),
                                pw.Text('d:r:m:d'),
                                pw.Text(':r,r.m,d:r,r.m,d:r,r.m,d:r,r.m,d:'),
                              ],
                  ),
                );
              },
            ),
          );

          var pageTheme = pw.PageTheme(
            // margin: pw.EdgeInsets.fromLTRB(
            //   format.marginLeft,
            //   format.marginTop,
            //   format.marginRight,
            //   format.marginBottom,
            // ),
            margin: pw.EdgeInsets.all(30),
            pageFormat: format,
          );

          List<List<int>> computedIndices = PdfUtil.computeCorrectWrapIndices(
            wrap: a,
            pageTheme: pageTheme,
          );

          final pdf2 = pw.Document();

          for (var index in computedIndices) {
            pdf2.addPage(
              pw.Page(
                pageTheme: pageTheme,
                build: (context) {
                  var r = pw.Wrap(children: a.children.sublist(index[0], index[1]));
                  return pw.Container(
                    decoration: pw.BoxDecoration(
                      
                    ),
                    child: r,
                  );
                },
              ),
            );
          }
          return pdf2.save();
        },
      ),
    );
  }
}

class PdfUtil {
  static List<List<int>> computeCorrectWrapIndices({
    required pw.Wrap wrap,
    pw.PageTheme? pageTheme,
  }) {
    final pdf = pw.Document();
    List<List<int>> computedIndices = [];
    pdf.addPage(
      pw.Page(
        pageTheme: pageTheme,
        build: (context) {
          computedIndices = _computeIndices(
            context,
            wrap,
            pageTheme: pageTheme,
          );
          return pw.SizedBox();
        },
      ),
    );
    pdf.save();
    return computedIndices;
  }

  static List<List<int>> _computeIndices(
    pw.Context context,
    pw.Wrap wrap, {
    count = 0,
    pw.PageTheme? pageTheme,
  }) {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageTheme: pageTheme,
        build: (context) {
          return wrap;
        },
      ),
    );
    pdf.save();
    int index = 0;

    int? hasReachedEndBefore;

    for (var child in wrap.children) {
      var box = child.box;

      // print('${count + index} ==> ${box?.x.toInt()} ${box?.y.toInt()} ${box?.width.toInt()} ${box?.height.toInt()}');
      if (box?.x == 0 && box?.y == 0) {
        if (hasReachedEndBefore != null) {
          break;
        } else {
          hasReachedEndBefore = index;
        }
      }

      index++;
    }

    hasReachedEndBefore ??= index;
    List<List<int>> extra = [];
    int end = count + index;

    if (index != wrap.children.length) {
      end = count + hasReachedEndBefore;
      extra = _computeIndices(
        context,
        pw.Wrap(
          children: wrap.children.sublist(hasReachedEndBefore),
        ),
        pageTheme: pageTheme,
        count: end,
      );
    } else {}

    List<List<int>> result = [
      [
        count,
        end
      ],
      ...extra,
      if (index - 1 == hasReachedEndBefore && extra.isEmpty)
        [
          count + wrap.children.length - 1,
          count + wrap.children.length
        ],
    ];
    return result;
  }
}
