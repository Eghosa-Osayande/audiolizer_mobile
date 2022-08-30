import 'package:bloc/bloc.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/score_editor/ui/widgets/solfa_text_field/solfa_input_controller.dart';

class FocusedBarCubit extends Cubit<Bar?> {
  FocusedBarCubit([Bar? bar]) : super(bar);

  void setKey(Bar key) {
    emit(key);
  }


}
