import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audiolizer/modules/models/project/project_model.dart';

class CurrentProjectCubit extends Cubit<Project> {
  CurrentProjectCubit(Project project) : super(project);
}
