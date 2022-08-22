import 'package:midi_util/src/midi_file.dart';
import 'package:solpha/modules/models/midi_actions/midi_action.dart';
import 'package:solpha/modules/models/track/track.dart';

class AddProgramChange implements MidiAction {
  final Track track;
  final int program;
  final double position;

  const AddProgramChange({
    required this.track,
    required this.program ,
    this.position = 0,
  });
  
  @override
  void run(MIDIFile midiFile) {
    midiFile.addProgramChange(
      tracknum: track.trackNumber,
      channel: track.trackNumber,
      time: position,
      program: program,
    );
  }
}
