import 'package:midi_util/src/midi_file.dart';
import 'package:solpha/modules/models/midi_actions/midi_action.dart';
import 'package:solpha/modules/models/score/key_signature.dart';
import 'package:solpha/modules/models/track/track.dart';

class AddKeySignature implements MidiAction {
  final Track track;

  final double position;
  final KeySignature keySignature;

  const AddKeySignature( {
    required this.track,
   
    this.position = 0,
   required this.keySignature,
  });

  @override
  void run(MIDIFile midiFile) {
    midiFile.addKeySignature(
      track: track.trackNumber,
      time: position,
      no_of_accidentals: keySignature.accidentalCount,
      accidental_mode: keySignature.accidentalMode,
      accidental_type: keySignature.accidentalType,
    );
  }
}
