part of 'note.dart';

extension ScoreConfigNoteX on ScoreConfigNote {
  

 
  int get tonicMidiNumber {
    return keySignature.midiNumber + ((tonicPitchNumber - 1) * 12);
    
  }

 


  Note _makeCopyX() {
    return ScoreConfigNote(
      bpm: bpm,
      timeSignature: timeSignature,
      keySignature: keySignature,
      scoreTitle: scoreTitle,
      tonicPitchNumber: tonicPitchNumber,
       createdAt:DateTime.now().toUtc(),
    );
  }

  String _displayStringX() {
    return '';
  }

  Future<void> _commitX(
    Track track,
    MIDIFile midiFile,
  ) async {
    

    midiFile.addTempo(
      track: track.trackNumber,
      time: 0,
      tempo: bpm,
    );
    midiFile.addTimeSignature(
      track: track.trackNumber,
      time: 0,
      numerator: timeSignature.numerator,
      denominator: timeSignature.denominator,
      clocks_per_tick: 24,
    );
    midiFile.addKeySignature(
      track: track.trackNumber,
      time: 0,
      no_of_accidentals: keySignature.accidentalCount,
      accidental_mode: keySignature.accidentalMode,
      accidental_type: keySignature.accidentalType,
    );
  }

  

}