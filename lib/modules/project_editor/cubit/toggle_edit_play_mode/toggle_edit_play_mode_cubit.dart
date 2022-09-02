import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:solpha/modules/project_editor/service/audio_player_service.dart';

part 'toggle_edit_play_mode_state.dart';

class ToggleEditPlayModeCubit extends Cubit<ToggleEditPlayModeState> {
  StreamSubscription<PlayerState>? sub;

  StreamSubscription<void>? sub2;

  ToggleEditPlayModeCubit() : super(ToggleEditPlayModeState.edit) {
    sub = AudioPlayerService.instance.onPlayerStateChanged.listen(onPlayerStateChangedListener);
    sub2 = AudioPlayerService.instance.onPlayerComplete.listen(onPlayerCompleteListener);
  }

  @override
  Future<void> close() {
    sub?.cancel();
    sub2?.cancel();
    return super.close();
  }

  void onPlayerCompleteListener(_) {
   
    AudioPlayerService.instance.seek(Duration(seconds: 0));
    AudioPlayerService.instance.pause();
    edit();
  }

  void onPlayerStateChangedListener(PlayerState event) {
 
    switch (event) {
      case PlayerState.playing:
        play();
        break;
      default:
        edit();
        break;
    }
  }

  void play() {
    emit(ToggleEditPlayModeState.playing);
  }

  void edit() {
    emit(ToggleEditPlayModeState.edit);
  }
}
