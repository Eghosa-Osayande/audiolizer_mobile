import 'dart:async';
import 'dart:typed_data';

import 'package:audiolizer/modules/project_editor/service/audio_player_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class AudioPlayerServiceImpl extends AudioPlayerService {
  final _player = AudioPlayer();

  AudioPlayerServiceImpl.visibleForWebImpl() : super.visibleForWebImpl();

  AudioPlayer get __player => _player;

  int playCount = 0;

  Future<void> setSourceBytes(Uint8List bytes) async {
    _player.setVolume(1);
    await _player.setSourceBytes(bytes);
  }

  Future<void> togglePlayerState() async {
    switch (_player.state) {
      case PlayerState.stopped:
        resume();
        break;
      case PlayerState.playing:
        _player.pause();
        break;
      case PlayerState.paused:
        resume();
        break;
      case PlayerState.completed:
        resume();
        break;
    }
  }

  bool get isPlaying => _player.state == PlayerState.playing;

  Future<void> resume() async {
    playCount++;
    _player.resume();
  }

  Future<void> pause() async {
    playCount++;
    _player.pause();
  }

  Future<void> stop() async {
    playCount++;
    _player.stop();
  }

  Future<void> seek(Duration position) async {
    playCount++;
    await _player.seek(position);
  }

  Future<Duration?> getCurrentFileDuration() {
    return _player.getDuration();
  }

  Stream<AudioPlayerState> get onPlayerStateChanged => __player.onPlayerStateChanged.map<AudioPlayerState>((event) {
        switch (event) {
          case PlayerState.playing:
            return AudioPlayerState.playing;
          default:
            return AudioPlayerState.notPlaying;
        }
      });
  Stream<void> get onPlayerComplete => __player.onPlayerComplete;
  Stream<Duration> get onPositionChanged => __player.onPositionChanged;
  Stream<Duration> get onDurationChanged => __player.onDurationChanged;
}
