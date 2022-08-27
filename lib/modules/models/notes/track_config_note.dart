part of 'note.dart';

extension TrackConfigNoteX on TrackConfigNote {
  @override
  Future<void> _commitX(
    Track track,
    MIDIFile midiFile,
  ) async {
    midiFile.addProgramChange(
      tracknum: track.trackNumber,
      channel: track.trackNumber,
      time: 0,
      program: program,
    );
  }

  @override
  Note _makeCopyX() {
    return TrackConfigNote(
      volume,
      program,
      createdAt: DateTime.now().toUtc(),
    );
  }

  @override
  String _displayStringX() {
    return '';
  }
}
