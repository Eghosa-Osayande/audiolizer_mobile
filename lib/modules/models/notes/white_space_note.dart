part of 'note.dart';
extension WhiteSpaceNoteX on WhiteSpaceNote {
  



  WhiteSpaceNote _makeCopyX([Track? track]) {
    return WhiteSpaceNote(createdAt: DateTime.now().toUtc());
  }
   
  String _displayStringX() {
    return ' ';
  }
}
