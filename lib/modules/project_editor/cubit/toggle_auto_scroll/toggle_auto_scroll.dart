import 'dart:async';

import 'package:audiolizer/modules/project_editor/repo/toggle_auto_scroll.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ToggleAutoScrollCubit extends Cubit<bool> {
  StreamSubscription<bool>? sub;

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  ToggleAutoScrollCubit() : super(true) {
    sub = ToggleAutoScrollRepo.instance.watchValue.listen(watchValue);
  }

  void watchValue(event) {
    emit(event);
  }

  void toggle() {
    ToggleAutoScrollRepo.instance.put(!state);
  }

  void turnOff() {
    ToggleAutoScrollRepo.instance.put(false);
  }

  @override
  Future<void> close() {
    sub?.cancel();

    return super.close();
  }
}
