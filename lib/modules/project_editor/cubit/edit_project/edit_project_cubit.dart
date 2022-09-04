import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:audiolizer/modules/models/bar/bar.dart';
import 'package:audiolizer/modules/models/project/project_model.dart';
import 'package:audiolizer/modules/models/score/score.dart';
import 'package:audiolizer/modules/models/track/track.dart';
import 'package:audiolizer/modules/project_editor/service/audio_player_service.dart';

part 'edit_project_cubit_state.dart';

class EditProjectCubit extends Cubit<EditProjectCubitState> {
  final Project project;

  EditProjectCubit({required this.project}) : super(EditProjectCubitState(project));

  void takeSnapShot() {
    print('snapshot taken');
    var scoreCopy = Score.fromJson(project.score.toJson());

    project.scoreUndoVersions.add(scoreCopy);
    project.scoreRedoVersions.clear();
    emit(EditProjectCubitState(project));
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
