import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solpha/modules/models/notes/duration_note.dart';
import 'package:solpha/modules/models/notes/music_note.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/music_note.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/note_dimensions.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/note_cursor.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/playback_progress.dart';

class DurationNoteWidget extends StatelessWidget {
  final DurationNote note;

  const DurationNoteWidget({
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
                        note.marker.symbol,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20
                        ),
                      )
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