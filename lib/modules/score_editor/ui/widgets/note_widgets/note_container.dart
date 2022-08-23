import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/note_dimensions.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/note_focus.dart';

class NoteContainer extends StatelessWidget {
  final Note note;

  const NoteContainer({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NoteFocus(
        note: note,
        builder: (context, hasFocus) {
          return Container(
            color: hasFocus ? Colors.red : Colors.black38,
            child: SizedBox(
              width: kNoteWidth,
              height: kNoteHeight,
              child: Center(
                child: Text(
                  note.map<String>(
                    music: (musicNote) => musicNote.solfa.symbol,
                    duration: (durationNote) => durationNote.marker.symbol,
                    Else: (note) => '',
                  ),
                ),
              ),
            ),
          );
        });
  }

  TextStyle get noteStyle {
    return GoogleFonts.inter(fontSize: 16);
  }
}
