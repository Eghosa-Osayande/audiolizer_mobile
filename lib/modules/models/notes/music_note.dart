part of 'note.dart';

class MusicNote extends Note with EquatableMixin {
  final Solfege solfa;
  final int octave;

  final int? volume;
  double? position;

  MusicNote(
    Track track, {
    required this.solfa,
    required this.octave,
    this.volume,
  }) : super._(track);

  @override
  List<Object?> get props => [
        solfa,
        octave
      ];

  @override
  bool? get stringify => true;

  bool get isSustained => solfa == Solfege.sustain;
  bool get isSilent => solfa == Solfege.silent;

  double compute(double previousPosition) {
    clearError();
    var _duration = duration;
    if (_duration.isFailure) {
      setError(_duration.failure);
      return previousPosition;
    }

    position = previousPosition;
    var midiFile = track.score.midiFile;
    AddNote(this).run(midiFile);
    return previousPosition + _duration.success;
  }

  Result<double, GenericException> get duration {
    Note? prev = this.previous;
    Note? next = this.next;
    if (prev == null) {
      return Failure(GenericException('No previous note'));
    }
    if (next == null) {
      return Failure(GenericException('Requires a tailing note'));
    }
    if (!(prev is DurationNote)) {
      return Failure(GenericException('Previous note must be ":", "." or ","'));
    }
    if (!(next is DurationNote)) {
      return Failure(GenericException('Next note must be ":", "." or ","'));
    }

    return prev.combineWith(next);
  }

  int computeMidiNoteNumber() {
    var note = _findSustainedNote();
    if (note != null) {
      var score = note.track.score;
      int pitch = score.intialSettings.tonicMidiNumber + note.solfa.offset + (note.octave * 12);
      return pitch;
    }
    return 0;
  }

  MusicNote? _findSustainedNote() {
    if (!isSustained) {
      return this;
    }
    Note? prev = previous;

    while (prev != null) {
      bool shouldContinue = prev.map<bool>(
        music: (musicNote) {
          if (musicNote.isSustained) {
            return true;
          }
          return false;
        },
        duration: (durationNote) {
          return true;
        },
      );

      if (shouldContinue == false) {
        break;
      } else {
        prev = prev.previous;
        continue;
      }
    }
    if (prev == null) {
      setError(GenericException('Invalid sustain'));
    }
    return prev?.map<MusicNote?>(
      music: (musicNote) => musicNote,
      duration: (durationNote) => null,
    );
  }
}
