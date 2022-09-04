import 'package:flutter_bloc/flutter_bloc.dart';

class ViewModeCubit extends Cubit<ViewModeState> {
  ViewModeCubit() : super(ViewModeState.readOnly);

  toggle() {
    switch (state) {
      case ViewModeState.edit:
        emit(ViewModeState.readOnly);
        break;
      case ViewModeState.readOnly:
        emit(ViewModeState.edit);
    }
  }

  void edit() {
     emit(ViewModeState.edit);
  }

  void readonly() {
     emit(ViewModeState.readOnly);
  }
}

enum ViewModeState {
  readOnly,
  edit;
}
