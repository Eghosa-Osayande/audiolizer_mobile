import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/project_editor/repo/toggle_metroneme.dart';

class ToggleMetronemeCubit extends Cubit<bool> {

  StreamSubscription<bool>? sub;
  ToggleMetronemeCubit() : super(false) {
    sub = ToggleMetronemeRepo.instance.watchMetronemeEnabledValue.listen(watchVolumeNavigation);
  }

  void watchVolumeNavigation(event) {
    emit(event);
  }

  void toggle(bool value) {
    ToggleMetronemeRepo.instance.put(value);
  }

  @override
  Future<void> close() {
    sub?.cancel();
    return super.close();
  }
}
