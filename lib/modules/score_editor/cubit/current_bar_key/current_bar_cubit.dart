import 'package:bloc/bloc.dart';
import 'package:solpha/modules/models/bar/bar.dart';

class CurrentBarCubit extends Cubit<Bar> {
  CurrentBarCubit(Bar bar) : super(bar);

  void setKey(Bar key) {
    emit(key);
  }

  void addNewBar() {
    // if (state.next != null) {
      
    //   emit(state.next!);
    // } else {
      var nextBar = Bar();
      state.insertAfter(nextBar);
      emit(nextBar);
    // }
  }
}
