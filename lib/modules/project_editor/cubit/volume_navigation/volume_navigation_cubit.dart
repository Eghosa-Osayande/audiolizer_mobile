import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audiolizer/modules/project_editor/repo/volume_navigation.dart';

class VolumeNavigationCubit extends Cubit<bool> {
  StreamSubscription<bool>? sub;
  VolumeNavigationCubit() : super(false) {
    sub = VolumeNavigationRepo.instance.watchVolumeNavigation.listen(watchVolumeNavigation);
  }

  void watchVolumeNavigation(event) {
    emit(event);
  }

  void toggle() {
    VolumeNavigationRepo.instance.put(!state);
  }

  @override
  Future<void> close() {
    sub?.cancel();
    return super.close();
  }
}
