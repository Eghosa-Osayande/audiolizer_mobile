import 'package:bloc/bloc.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/score_editor/ui/widgets/solfa_text_field/solfa_input_controller.dart';

class CurrentBarCubit extends Cubit<Bar?> {
  CurrentBarCubit([Bar? bar]) : super(bar);

  void setKey(Bar key) {
    emit(key);
  }

  void addNewBar() {
    // if (state.next != null) {

    //   emit(state.next!);
    // } else {
    var nextBar = Bar(
      createdAt: DateTime.now(),
      solfaEditingController: SolfaEditingController(),
    );
    state?.insertAfter(nextBar);
    emit(nextBar);
    // }
  }
}
