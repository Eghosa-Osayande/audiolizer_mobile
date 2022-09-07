import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfFontProvider {
  static pw.Font musicFont = pw.Font.helvetica();
  static pw.Font durationFont = pw.Font.helvetica();
  static pw.Font lyrics = pw.Font.helvetica();
  static  pw.Font fallback= pw.Font.helvetica();
  static init() async {
    fallback = await PdfGoogleFonts.interRegular();
    musicFont = await PdfGoogleFonts.interBold();
    durationFont = await PdfGoogleFonts.notoSansJavaneseBold();
    lyrics = await PdfGoogleFonts.interMedium();
  }
}
