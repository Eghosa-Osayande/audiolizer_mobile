import 'package:midi_util/src/midi_file.dart';
import 'package:solpha/modules/models/midi_actions/midi_action.dart';
import 'package:solpha/modules/models/track/track.dart';

class AddTempo implements MidiAction {
  final Track track;
  final int tempo;
  final double position;

  const AddTempo({
    required this.track,
    required this.tempo,
    this.position = 0,
  });
  
  @override
  void run(MIDIFile midiFile) {
  midiFile.addTempo(
      track: track.trackNumber,
      time: position,
      tempo: tempo,
    );
  }
}
