import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum KeyboardVisibility { visible, hidden, hiddenForSytemUI }

class ToggleKeyboardVisibilityCubit extends Cubit<KeyboardVisibility> {
  ToggleKeyboardVisibilityCubit() : super(KeyboardVisibility.visible);

  void toggle() {
    switch (state) {
      case KeyboardVisibility.visible:
        emit(KeyboardVisibility.hidden);
        break;
      case KeyboardVisibility.hidden:

      case KeyboardVisibility.hiddenForSytemUI:
        emit(KeyboardVisibility.visible);
        break;
    }
  }

  void open() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    emit(KeyboardVisibility.visible);
  }

  void hiddenForSytemUI() {
    emit(KeyboardVisibility.hiddenForSytemUI);
  }

  void showForSytemUI() {
    if (state == KeyboardVisibility.hiddenForSytemUI) {
      emit(KeyboardVisibility.visible);
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
  }
}
