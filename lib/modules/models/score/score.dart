import 'package:flutter/cupertino.dart';
import 'package:midi_util/midi_util.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/track/track.dart';

import 'score_settings.dart';

class Score with ChangeNotifier, ErrorStreamMixin<Track> {
  final ScoreSettings intialSettings;

  final Map<int, Track> _tracks = {};

  static const int _tracksLimit = 10;

  MIDIFile _midiFile = MIDIFile(numTracks: _tracksLimit);
  MIDIFile get midiFile => _midiFile;

  void _resetMidiFile() {
    _midiFile = MIDIFile(numTracks: _tracksLimit);
  }

  Score({required this.intialSettings});

  bool createTrack({
    int program = 48,
    int volume = 100,
    int? trackNumber,
  }) {
    if (_tracks.length < _tracksLimit) {
      var _trackNumber = trackNumber ?? _tracks.length;
      _tracks.putIfAbsent(
        _trackNumber,
        () => Track(
          score: this,
          trackNumber: _trackNumber,
          program: program,
          volume: volume,
        ),
      );

      return true;
    }
    return false;
  }

  List<Track> get tracks => _tracks.values.toList();

  Future<void> commit() async {
    _resetMidiFile();
    clearError();
    for (var track in _tracks.values) {
      var result = track.computeNotes();
      if (result.isSuccess) {
        continue;
      } else {
        
        setError(track);
        return;
      }
    }

    for (var track in _tracks.values) {
      await track.commit();
    }

    notifyListeners();
  }
}
