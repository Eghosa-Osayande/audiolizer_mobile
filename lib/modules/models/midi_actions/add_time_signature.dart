import 'package:midi_util/src/midi_file.dart';
import 'package:solpha/modules/models/midi_actions/midi_action.dart';
import 'package:solpha/modules/models/score/key_signature.dart';
import 'package:solpha/modules/models/score/time_signature.dart';
import 'package:solpha/modules/models/track/track.dart';

class AddTimeSignature implements MidiAction {
  final Track track;

  final double position;
  final TimeSignature timeSignature;

  const AddTimeSignature( {
    required this.track,
    this.position = 0,
   required this.timeSignature,
  });

  @override
  void run(MIDIFile midiFile) {
    midiFile.addTimeSignature(
      track: track.trackNumber,
      time: position,
      numerator: timeSignature.numerator,
      denominator: timeSignature.denominator,
      clocks_per_tick: 24,
    );
  }
}
