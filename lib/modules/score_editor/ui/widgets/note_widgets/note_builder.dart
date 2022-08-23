import 'package:flutter/material.dart';
import 'package:solpha/modules/models/notes/decoration_notes.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/note_container.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/spacing_notes.dart';

class NoteBuilder extends StatelessWidget {
 
  final Note note;

  const NoteBuilder({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (note is SpacingNote) {
      switch ((note as SpacingNote).type) {
        case NoteSpacing.whiteSpace:
          return WhiteSpaceNote(note: note,);

        case NoteSpacing.newLine:
          return NewLineNote(note: note,);
      }
    }
    return NoteContainer(note: note);
  }
}
