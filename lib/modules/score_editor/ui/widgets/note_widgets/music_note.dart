import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solpha/modules/models/notes/music_note.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/note_dimensions.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/note_cursor.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/playback_progress.dart';

class MusicNoteWidget extends StatelessWidget {
  final MusicNote note;

  const MusicNoteWidget({
    Key? key,
    required this.note,
  }) : super(key: key);

  String displayString(MusicNote note) {
    String level = (note.octave > 0) ? "'" : ",";
    return note.solfa.symbol + level * note.octave.abs();
  }

  @override
  Widget build(BuildContext context) {
    return NoteErrorIndicator(
      note: note,
      child: NoteCursor(
          note: note,
          builder: (context, hasFocus) {
            return Container(
              color: Colors.black38,
              child: SizedBox(
                width: note.map<double>(
                  music: (musicNote) => kNoteWidth,
                  duration: (durationNote) => kNoteWidth,
                  Else: (note) => kNoteWidth,
                ),
                height: kNoteHeight,
                child: PlaybackProgress(
                  note: note,
                  child: Center(
                    child: Text(
                      displayString(note),
                      style: noteStyle,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  TextStyle get noteStyle {
    return GoogleFonts.inter(fontSize: 16, fontStyle: FontStyle.italic);
  }
}

class NoteErrorIndicator extends StatefulWidget {
  final Widget child;
  final Note note;
  const NoteErrorIndicator({Key? key, required this.child, required this.note}) : super(key: key);

  @override
  State<NoteErrorIndicator> createState() => _NoteErrorIndicatorState();
}

class _NoteErrorIndicatorState extends State<NoteErrorIndicator> {
  void onStatusChanged() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.note.errorStream,
      builder: (context, snapshot) {
        var data = snapshot.data;
        if (data != null) {
          return Tooltip(
            message: '${widget.note.error?.reason ?? ""}',
            preferBelow: false,
            child: Container(
              decoration: BoxDecoration(color: Colors.red),
              child: Container(
                // margin: EdgeInsets.all(2),
                child: widget.child,
              ),
            ),
          );
        } else {
           return widget.child;
        }
      },
    );
  }
}
