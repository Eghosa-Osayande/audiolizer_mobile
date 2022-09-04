import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solpha/modules/models/project/project_model.dart';
import 'package:solpha/modules/project_management/repo/project_repo.dart';

part 'reload_project_cubit_state.dart';

class ReloadProjectCubit extends Cubit<ReloadProjectCubitState> {
  final Project project;
  StreamSubscription<Project>? _sub;

  ReloadProjectCubit({required this.project}) : super(ReloadProjectCubitState(project)) {
    _sub = ProjectRepo.instance.updatedProjectStream.listen(watchProject);
  }

  void watchProject(Project updatedProject) {
    emit(ReloadProjectCubitState(project));
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
