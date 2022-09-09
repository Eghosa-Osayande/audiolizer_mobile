import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum SolfaKeyboardVisibility { visible, hidden }

class ToggleSolfaKeyboardVisibilityCubit extends Cubit<SolfaKeyboardVisibility> {
  ToggleSolfaKeyboardVisibilityCubit() : super(SolfaKeyboardVisibility.hidden);

  void toggle() {
    switch (state) {
      case SolfaKeyboardVisibility.visible:
        emit(SolfaKeyboardVisibility.hidden);
        break;
      case SolfaKeyboardVisibility.hidden:
        emit(SolfaKeyboardVisibility.visible);
        break;
    }
  }

  void open() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    emit(SolfaKeyboardVisibility.visible);
  }

  void hide() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    emit(SolfaKeyboardVisibility.hidden);
  }
}
