import 'dart:io';

import 'package:file/memory.dart';
import 'package:flutter/cupertino.dart';
import 'package:midi_util/midi_util.dart';
import 'package:result_type/result_type.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/track/track.dart';

import 'score_settings.dart';

class Score with ErrorStreamMixin<Track> {
  final ScoreSettings intialSettings;

  final Map<int, Track> _tracksMap = {};

  static const int _tracksLimit = 10;

  MIDIFile _midiFile = MIDIFile(numTracks: _tracksLimit);

  MIDIFile get midiFile => _midiFile;

  bool hasUpdates = true;

  void _resetMidiFile() {
    _midiFile = MIDIFile(numTracks: _tracksLimit);
  }

  Score({required this.intialSettings});

  bool createTrack({
    int program = 48,
    int volume = 100,
    int? trackNumber,
  }) {
    if (_tracksMap.length < _tracksLimit) {
      var _trackNumber = trackNumber ?? _tracksMap.length;
      _tracksMap.putIfAbsent(
        _trackNumber,
        () => Track(
          score: this,
          trackNumber: _trackNumber,
          program: program,
          volume: volume,
        )..addStartSeperator(),
      );

      return true;
    }
    return false;
  }

  List<Track> get tracks => _tracksMap.values.toList();
  Iterable<Track> get trackIterable => _tracksMap.values;

  Future<Result<File,Track>?> commit() async {
    if (hasUpdates) {
      _resetMidiFile();
      clearError();
      for (var track in _tracksMap.values) {
        var result = track.computeNotes();
        if (result.isSuccess) {
          track.addMetronemeTrack();
          continue;
        } else {
          setError(track);
          return Failure(track);
        }
      }

      for (var track in _tracksMap.values) {
        await track.commit();
      }

      File outputFile = MemoryFileSystem().file('${DateTime.now().millisecondsSinceEpoch}.mid');
      await _midiFile.writeFile(outputFile);
      hasUpdates = false;
      return Success(outputFile);
    }
  }
}
