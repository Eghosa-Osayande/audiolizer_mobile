import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/bar/bar.dart';

class FocusedBarCubit extends Cubit<Bar?> {
  FocusedBarCubit() : super(null);

  focusBar(Bar bar) {
    emit(bar);
  }

  unfocusBar() {
    emit(null);
  }
}
