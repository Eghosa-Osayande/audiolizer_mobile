import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audiolizer/modules/models/project/project_model.dart';

class CurrentBarGroupIndexCubit extends Cubit<int> {
  CurrentBarGroupIndexCubit(int index) : super(index);
}
