part of 'note.dart';

extension MusicNoteX on MusicNote {
  bool get isSustained => solfa == Solfege.sustain;
  bool get isSilent => solfa == Solfege.silent;

  int computeMidiNoteNumber(ScoreConfigNote intialSettings) {
    var note = this;
    int pitch = intialSettings.tonicMidiNumber + note.solfa.offset + (note.octave * 12);
    return pitch;
  }

  @override
  Future<void> _commitX(Track track, MIDIFile midiFile) async {
    if (startAt == null) {
      return;
    }
    if (isSustained) {
      return;
    }

    var position = startAt!;
    var pitch = computeMidiNoteNumber(intialScoreConfigNote!);
    print([
      solfa.symbol + '${octave}',
      position,
      duration
    ]);
    midiFile.addNote(
      track: track.trackNumber,
      channel: track.trackNumber,
      pitch: isSilent ? 0 : pitch,
      time: position,
      duration: duration,
      volume: isSilent ? 0 : intialTrackConfigNote!.volume,
    );
  }

  @override
  Note _makeCopyX([Track? track]) {
    return MusicNote(solfa: solfa, octave: octave, createdAt: DateTime.now().toUtc());
  }

  @override
  String _displayStringX() {
    String level = (octave > 0) ? "'" : ",";
    return solfa.symbol + level * octave.abs();
  }
}
