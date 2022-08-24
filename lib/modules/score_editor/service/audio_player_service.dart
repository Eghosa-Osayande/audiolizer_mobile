import 'dart:async';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';

class AudioPlayerService {
  static final AudioPlayerService _instance = AudioPlayerService._();

  AudioPlayerService._();
  factory AudioPlayerService.__() {
    return _instance;
  }

  static AudioPlayerService get instance => AudioPlayerService.__();

  final _player = AudioPlayer();

  AudioPlayer get __player => _player;

  int playCount = 0;

  Future<void> setSourceBytes(Uint8List bytes) async {
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

  Future<void> seek(Duration position) async {
     playCount++;
    await _player.seek(position);
  }

  Future<Duration?> getCurrentFileDuration() {
    return _player.getDuration();
  }

  Stream<PlayerState> get onPlayerStateChanged => __player.onPlayerStateChanged;
  Stream<void> get onPlayerComplete => __player.onPlayerComplete;
  Stream<Duration> get onPositionChanged => __player.onPositionChanged;
  Stream<Duration> get onDurationChanged => __player.onDurationChanged;
}
