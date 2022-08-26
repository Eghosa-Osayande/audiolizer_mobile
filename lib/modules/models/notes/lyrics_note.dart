import 'package:solpha/modules/models/notes/note.dart';

class LyricsNote extends Note {
  final String lyrics;
  LyricsNote(this.lyrics);
  @override
  String displayString() {
    return lyrics;
  }

  @override
  Note makeCopy() {
   return LyricsNote(lyrics);
  }
}
