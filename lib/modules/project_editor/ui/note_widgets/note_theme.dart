import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audiolizer/modules/models/notes/note.dart';

class NoteTheme {
  final double fontSize;

  NoteTheme([this.fontSize = 18]);

  double get musicFontSize => fontSize - 2;
  double get musicDurationSize => fontSize - 2;
  double get musicWhiteSpaceSize => fontSize - 2;


  TextStyle get style {
    return GoogleFonts.zillaSlab(fontSize: fontSize);
  }

  TextStyle getStyle(Note note) {
    return style;
  }
}

class NoteThemeProvider extends Cubit<NoteTheme> {
  NoteThemeProvider() : super(NoteTheme());

  static NoteThemeProvider of(BuildContext context) {
    return BlocProvider.of<NoteThemeProvider>(context);
  }
}
