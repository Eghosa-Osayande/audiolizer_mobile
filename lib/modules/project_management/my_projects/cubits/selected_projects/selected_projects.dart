import 'dart:collection';

import 'package:audiolizer/modules/models/project/project_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedProjectsCubit extends Cubit<SelectedProjects?> {
  SelectedProjectsCubit() : super(null);
  void startSelection() {
    emit(SelectedProjects([]));
  }

  void endSelection() {
    emit(null);
  }

  void selectAll(List<Project> allProjects) {
    var r = SelectedProjects(allProjects.toList());
   
    emit(r);
  }

  void selectProject(Project project) {
    if (state?.selectedProjects.contains(project) ?? false) {
      print('r');
      state?.selectedProjects.remove(project);
    } else {
      print('a');
      state?.selectedProjects.add(project);
    }
    emit(SelectedProjects(state?.selectedProjects ?? []));
  }
}

class SelectedProjects with EquatableMixin {
  final List<Project> selectedProjects;
  DateTime _ = DateTime.now();

  SelectedProjects(this.selectedProjects);

  @override
  // TODO: implement props
  List<Object?> get props => [
        _
      ];
}
