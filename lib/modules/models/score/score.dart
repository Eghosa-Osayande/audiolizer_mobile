import 'package:midi_util/midi_util.dart';
import 'package:solpha/modules/models/track/track.dart';

import 'score_settings.dart';

class Score {
  final ScoreSettings intialSettings;

  final Map<int, Track> _tracks = {};

  static const int _tracksLimit = 10;

  MIDIFile _midiFile = MIDIFile(numTracks: _tracksLimit);
  MIDIFile get midiFile => _midiFile;

  void _resetMidiFile() {
    _midiFile == MIDIFile(numTracks: _tracksLimit);
  }

  Score({required this.intialSettings});

  bool createTrack({
    int program = 48,
    int volume = 100,
  }) {
    if (_tracks.length < _tracksLimit) {
      var trackNumber = _tracks.length;
      _tracks[trackNumber] = Track(
        score: this,
        trackNumber: trackNumber,
        program: program,
        volume: volume,
      );
      return true;
    }
    return false;
  }

  List<Track> get tracks => _tracks.values.toList();

  void computeTracks() {
    _resetMidiFile();
    for (var track in _tracks.values) {
      track.computeNotes();
    }
  }
}
