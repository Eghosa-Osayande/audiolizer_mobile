import 'dart:async';

import 'package:audiolizer/modules/project_editor/repo/toggle_playback_progress_visibility.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TogglePlayBackProgressCubit extends Cubit<bool> {
  StreamSubscription<bool>? sub;
  TogglePlayBackProgressCubit() : super(false) {
    sub = TogglePlaybackProgressVisibilityRepo.instance.watchValue.listen(watchVolumeNavigation);
  }

  void watchVolumeNavigation(bool event) {
    emit(event);
  }

  void toggle(bool value) {
    TogglePlaybackProgressVisibilityRepo.instance.put(value);
  }

  @override
  Future<void> close() {
    sub?.cancel();
    return super.close();
  }
}
