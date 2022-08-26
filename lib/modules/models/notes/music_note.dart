import 'package:equatable/equatable.dart';
import 'package:midi_util/midi_util.dart';
import 'package:result_type/result_type.dart';
import 'package:solpha/modules/exceptions/exceptions.dart';
import 'package:solpha/modules/models/notes/config_notes.dart';
import 'package:solpha/modules/models/notes/white_space_note.dart';
import 'package:solpha/modules/models/notes/duration_note.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/models/track/track.dart';

import 'enums/solfege.dart';
import 'note.dart';

class MusicNote extends Note with EquatableMixin {
  final Solfege solfa;

  final int octave;

  final int? volume;

  MusicNote({
    required this.solfa,
    required this.octave,
    this.volume,
  }) : super();

  @override
  List<Object?> get props => [
        solfa,
        octave,
        super.createdAt
      ];

  @override
  bool? get stringify => true;

  bool get isSustained => solfa == Solfege.sustain;
  bool get isSilent => solfa == Solfege.silent;

  int computeMidiNoteNumber(ScoreConfigNote intialSettings) {
    var note = this;
    int pitch = intialSettings.tonicMidiNumber + note.solfa.offset + (note.octave * 12);
    return pitch;
  }

  @override
  Future<void> commit( Track track,MIDIFile midiFile) async{
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
    return super.commit( track,midiFile);
    
  }

  @override
  Note makeCopy([Track? track]) {
    return MusicNote(solfa: solfa, octave: octave);
  }

   @override
  String displayString() {
    String level = (octave > 0) ? "'" : ",";
    return solfa.symbol + level * octave.abs();
  }
}
