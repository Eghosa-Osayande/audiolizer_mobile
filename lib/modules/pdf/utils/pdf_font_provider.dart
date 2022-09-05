import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfFontProvider {
  static pw.Font musicFont = pw.Font.helvetica();
  static pw.Font durationFont = pw.Font.helvetica();
  static pw.Font lyrics = pw.Font.helvetica();
  static late pw.Font fallback;
  static init() async {
    fallback = await PdfGoogleFonts.interRegular();
    musicFont = await PdfGoogleFonts.interBold();
    durationFont = await PdfGoogleFonts.notoSansJavaneseBold();
    lyrics = await PdfGoogleFonts.interMedium();
  }
}
