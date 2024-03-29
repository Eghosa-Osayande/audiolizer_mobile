part of '../note.dart';

extension MusicNoteX on MusicNote {
  bool get isSustained => solfa == Solfege.sustain;
  bool get isSilent => solfa == Solfege.silent;

  @override
  Future<void> _commitX(Track track, MIDIFile midiFile, {bool isMetroneme = false}) async {
    if (startAt == null) {
      return;
    }
    if (isSustained) {
      return;
    }

    var position = startAt!;
    var note = this;
    int tonicMidiNumber = track.score.keySignature.midiNumber + ((track.score.tonicPitchNumber - 1) * 12);
    int pitch = tonicMidiNumber + note.solfa.offset + (note.octave * 12);
    // print([
    //   solfa.symbol + '${octave}',
    //   position,
    //   duration
    // ]);
   
    if (isMetroneme) {
      int metronemePitch= track.score.keySignature.midiNumber+(12*3);
      midiFile.addNote(
        track: track.trackNumber,
        channel: track.trackNumber,
        pitch:metronemePitch,
        time: position,
        duration: duration,
        volume: 127,
      );
    } else {
      midiFile.addNote(
        track: track.trackNumber,
        channel: track.trackNumber,
        pitch: isSilent ? 0 : pitch,
        time: position,
        duration: duration,
        volume: isSilent ? 0 : track.volume ,
      );
    }
  }

  @override
  Note _makeCopyX([Track? track]) {
    return MusicNote(solfa: solfa, octave: octave, createdAt: DateTime.now().toUtc());
  }

  @override
  String _displayStringX() {
    String level = "'";
    if (octave > 0) {
      return solfa.symbol + level * octave.abs();
    } else {
      return level * octave.abs() + solfa.symbol;
    }
  }
}
