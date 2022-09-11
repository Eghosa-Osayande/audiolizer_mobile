import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audiolizer/modules/models/project/project_model.dart';
import 'package:audiolizer/modules/project_management/repo/project_repo.dart';

class MyProjectsCubit extends Cubit<AllProjects?> {
  StreamSubscription<List<Project>>? _sub;
  MyProjectsCubit() : super(null) {
    _sub = ProjectRepo.instance.projectListStream.listen(watchProjectsList);
  }

  void watchProjectsList(List<Project> projects) {
    emit(AllProjects(projects));
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}

class AllProjects with EquatableMixin{
  final List<Project> projects ;
  DateTime _ = DateTime.now();

  AllProjects(this.projects);
  
  @override
  // TODO: implement props
  List<Object?> get props => [_];
}
