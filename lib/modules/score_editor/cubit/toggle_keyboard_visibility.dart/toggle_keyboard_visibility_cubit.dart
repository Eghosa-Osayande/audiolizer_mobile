import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum KeyboardVisibility { visible, hidden }

class ToggleKeyboardVisibilityCubit extends Cubit<KeyboardVisibility> {
  ToggleKeyboardVisibilityCubit() : super(KeyboardVisibility.visible);

  void toggle() {
    switch (state) {
      case KeyboardVisibility.visible:
        emit(KeyboardVisibility.hidden);
        break;
      case KeyboardVisibility.hidden:
        emit(KeyboardVisibility.visible);
        break;
    }
  }
}
