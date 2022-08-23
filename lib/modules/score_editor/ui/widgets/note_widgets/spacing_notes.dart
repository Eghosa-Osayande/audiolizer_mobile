import 'package:flutter/material.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/note_dimensions.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/note_focus.dart';

class WhiteSpaceNote extends StatelessWidget {
  final Note note;
  const WhiteSpaceNote({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NoteFocus(
        note: note,
        builder: (context, hasFocus) {
          return Container(
            color: Colors.transparent,
            child: SizedBox(
              width: kNoteWidth,
              height: kNoteHeight,
            ),
          );
        });
  }
}

class NewLineNote extends StatelessWidget {
  final Note note;
  const NewLineNote({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NoteFocus(
        note: note,
        builder: (context, hasFocus) {
          return Container(
             color: Colors.transparent,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SizedBox(
                    height: kNoteHeight,
                  ),
                )
              ],
            ),
          );
        });
  }
}
