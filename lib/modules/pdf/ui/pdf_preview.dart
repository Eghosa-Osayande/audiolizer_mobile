import 'package:audiolizer/modules/models/project/project_model.dart';
import 'package:audiolizer/modules/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ScorePdfPreview extends StatelessWidget {
  static String path = '/ScorePdfPreview';

  static Route route({required Project project}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: path),
      builder: (_) => ScorePdfPreview(project: project),
    );
  }

  final Project project;
  const ScorePdfPreview({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<pw.Widget>>(
            future: project.toPDFAsync(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data!;
                return _ScorePdfPreview(
                  children: data,
                  project: project,
                );
              }
              if (snapshot.hasError) {
                print(snapshot.error);
                return Center(
                  child: Text('Error rendering PDF'),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}

class _ScorePdfPreview extends StatelessWidget {
  const _ScorePdfPreview({
    Key? key,
    required this.children,
    required this.project,
  }) : super(key: key);

  final List<pw.Widget> children;
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF - ${project.title}'),
      ),
      body: PdfPreview(
        canDebug: false,
        allowPrinting: true,
        dynamicLayout: false,
        pdfFileName: project.title+'_AUDIOLIZER',
        padding: EdgeInsets.zero,
        onPrinted: (context) {},
        onPrintError: (context, error) {},
        onShared: (context) {},
        scrollViewDecoration: BoxDecoration(color: AppColors.instance.black),
        build: (format) {
          var pageTheme = pw.PageTheme(
            margin: pw.EdgeInsets.all(20),
            pageFormat: format,
          );

          final pdf2Save = pw.Document();

          pdf2Save.addPage(
            pw.MultiPage(
              pageTheme: pageTheme,
              build: (context) {
                var wrap = pw.Wrap(
                  runAlignment: pw.WrapAlignment.center,
                  crossAxisAlignment: pw.WrapCrossAlignment.center,
                  children: children,
                );
                return [
                  wrap
                ];
              },
            ),
          );

          return pdf2Save.save();
        },
      ),
    );
  }
}
