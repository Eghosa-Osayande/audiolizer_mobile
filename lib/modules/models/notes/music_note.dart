import 'package:equatable/equatable.dart';
import 'package:result_type/result_type.dart';
import 'package:solpha/modules/exceptions/exceptions.dart';
import 'package:solpha/modules/models/midi_actions/add_note.dart';
import 'package:solpha/modules/models/notes/decoration_notes.dart';
import 'package:solpha/modules/models/notes/duration_note.dart';
import 'package:solpha/modules/models/track/track.dart';

import 'enums/solfege.dart';
import 'note.dart';

class MusicNote extends Note with EquatableMixin {
  final Solfege solfa;

  final int octave;

  final int? volume;



  MusicNote(
    Track track, {
    required this.solfa,
    required this.octave,
    this.volume,
  }) : super(track);

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

  int computeMidiNoteNumber() {
    var note = this;
    var score = note.track.score;
    int pitch = score.intialSettings.tonicMidiNumber + note.solfa.offset + (note.octave * 12);
    return pitch;
  }

  @override
  Future<void> commit() async {
    super.commit();
    AddNote(this).run(track.score.midiFile);
  }

  @override
  Note makeCopy([Track? track]) {
    // TODO: implement makeCopy
    return MusicNote(track??this.track, solfa: solfa, octave: octave);
  }
}
