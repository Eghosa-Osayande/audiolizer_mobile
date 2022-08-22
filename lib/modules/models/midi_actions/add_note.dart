import 'package:midi_util/src/midi_file.dart';
import 'package:solpha/modules/exceptions/exceptions.dart';
import 'package:solpha/modules/models/midi_actions/midi_action.dart';
import 'package:solpha/modules/models/notes/note.dart';

class AddNote implements MidiAction {
  final MusicNote note;
  const AddNote(this.note);
  @override
  void run(MIDIFile midiFile) {
    if (note.position == null) {
      note.setError(GenericException('Compute this note'));
      return;
    }
    var duration = note.duration;
    if (duration.isFailure) {
      note.setError(duration.failure);
      return;
    }
    var track = note.track;
    var position = note.position!;
    var pitch = note.computeMidiNoteNumber();

    midiFile.addNote(
      track: track.trackNumber,
      channel: track.trackNumber,
      pitch: note.isSilent ? 0 : pitch,
      time: position,
      duration: duration.success,
      volume: note.isSilent ? 0 : (note.volume ?? track.volume),
    );
  }
}
