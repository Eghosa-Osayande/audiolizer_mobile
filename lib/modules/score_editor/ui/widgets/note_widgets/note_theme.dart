import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solpha/modules/models/notes/note.dart';

class NoteTheme {
  final double fontSize;

  NoteTheme([this.fontSize = 20]);

  double get musicFontSize => fontSize - 2;
  double get musicDurationSize => fontSize - 2;
  double get musicWhiteSpaceSize => fontSize - 2;

  Size get computeSize {
    double c() => 10 - ((20 - fontSize) / 20);
    ;

    return Size(8, 24);
  }

  TextStyle get constantStyle {
    return style;
    return GoogleFonts.inter(fontSize: 20);
  }

  TextStyle get style {
    return GoogleFonts.inter(fontSize: fontSize);
  }

  TextStyle getStyle(Note note) {
    return style;
  }
}

class NoteThemeProvider extends Cubit<NoteTheme> {
  NoteThemeProvider() : super(NoteTheme());

  Size _size = Size(8, 24);

  setFontSize(double fontSize) {
    emit(NoteTheme(fontSize));
  }

  notifyChildSize(Size? size) {
    if (size != null) {
      double w = _size.width;
      double h = _size.height;
      if (size.width >= _size.width) {
        w = size.width;
      }
      if (size.height >= _size.height) {
        h = size.height;
      }
      _size = Size(w, h);
    }
  }

  Size get size => _size;

  static NoteThemeProvider of(BuildContext context) {
    return BlocProvider.of<NoteThemeProvider>(context);
  }
}
