import 'dart:async';
import 'dart:typed_data';

import 'package:audiolizer/modules/project_editor/service/audio_player_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audiolizer/modules/app_services_controller/services_config.dart';

import 'dart:js' as js;
import 'package:js/js.dart' as jsx;

AudioPlayerService getAudioPlayerService() => AudioPlayerServiceWeb.visibleForWebImpl();

class AudioPlayerServiceWeb extends AudioPlayerService {
  AudioPlayerServiceWeb.visibleForWebImpl() : super.visibleForWebImpl() {
    jsSetPlayerState = jsx.allowInterop(_setPlayerState);
    jsSetPostionChanged = jsx.allowInterop(_setPostionChanged);
    jsSetPlayerComplete = jsx.allowInterop(_setPlayerComplete);
    jsSetDurationChanged = jsx.allowInterop(_setDurationChanged);
  }

  Future<void> setSourceBytes(Uint8List bytes) async {
    js.context.callMethod('setSourceBytes', [
      bytes
    ]);
  }

  Future<void> togglePlayerState() async {
    js.context.callMethod('togglePlayerState');
  }

  bool get isPlaying {
    return js.context.callMethod('isPlaying');
  }

  Future<void> resume() async {
    playCount++;
    return js.context.callMethod('resume');
  }

  Future<void> pause() async {
    playCount++;
    return js.context.callMethod('pause');
  }

  Future<void> stop() async {
    playCount++;
    return js.context.callMethod('stop');
  }

  Future<void> seek(Duration position) async {
    playCount++;
    return js.context.callMethod('seek', [
      position.inSeconds
    ]);
  }

  Future<Duration?> getCurrentFileDuration() async {
    var timeInseconds = js.context.callMethod('getCurrentFileDuration');
    return Duration(seconds: timeInseconds);
  }

  static final StreamController<AudioPlayerState> _playerState = StreamController.broadcast();

  Stream<AudioPlayerState> get onPlayerStateChanged {
    return _playerState.stream;
  }

  static _setPlayerState(String value) {
    print('dart @==>$value');
    switch (value) {
      case 'playing':
        _playerState.add(AudioPlayerState.playing);
        break;
      default:
        _playerState.add(AudioPlayerState.notPlaying);
        break;
    }
  }

  static final StreamController<Duration> _postionChanged = StreamController.broadcast();

  Stream<Duration> get onPositionChanged {
    return _postionChanged.stream;
  }

  static _setPostionChanged(num value) {
    print('position @==>$value');
    _postionChanged.add(Duration(seconds: value.toInt()));
  }

  static final StreamController<void> _playerComplete = StreamController.broadcast();

  Stream<void> get onPlayerComplete {
    return _playerComplete.stream;
  }

  static _setPlayerComplete() {
    print('complete @==>value');
    _playerComplete.add(null);
  }

    static final StreamController<Duration> _durationChanged = StreamController.broadcast();

  Stream<Duration> get onDurationChanged {
    return _durationChanged.stream;
  }

  static _setDurationChanged(num value) {
    print('new duration @==>$value');
    _durationChanged.add(Duration(seconds: value.toInt()));
  }

}

@jsx.JS('setPlayerState')
external set jsSetPlayerState(void Function(String) f);

@jsx.JS('setPostionChanged')
external set jsSetPostionChanged(void Function(num value) f);

@jsx.JS('setPlayerComplete')
external set jsSetPlayerComplete(void Function() f);

@jsx.JS('setDurationChanged')
external set jsSetDurationChanged(void Function(num value) f);