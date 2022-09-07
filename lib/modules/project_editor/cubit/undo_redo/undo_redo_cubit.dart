import 'package:audiolizer/modules/models/score/score.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audiolizer/modules/models/project/project_model.dart';

class UndoRedoCubit extends Cubit<UndoRedoState> {
  final Project project;
  final List<Score> projectUndoVersions = [];
  final List<Score>  projectRedoVersions = [];

  UndoRedoCubit({required this.project}) : super(UndoRedoState(project));

  void takeSnapShot() {
    print('snapshot taken');
    var scoreCopy = Score.fromJson(project.score.toJson());
    projectUndoVersions.add(scoreCopy);
    projectRedoVersions.clear();

  }

  void undo() {
    if (projectUndoVersions.isNotEmpty) {
      var score = projectUndoVersions.removeLast();
      print([
        score.length,
        score.tracks.first.first.notes.length
      ]);
      projectRedoVersions.add(project.score);
      project.score = score;

      emit(UndoRedoState(project));
    }
  }

  void redo() {
    if (projectRedoVersions.isNotEmpty) {
      var score = projectRedoVersions.removeLast();
      print([
        score.length,
        score.tracks.first.first.notes.length
      ]);
      projectUndoVersions.add(project.score);
      project.score = score;

      emit(UndoRedoState(project));
    }
  }
}

class UndoRedoState with EquatableMixin {
  late final int id = DateTime.now().millisecondsSinceEpoch;
  final Project project;

  UndoRedoState(
    this.project,
  );

  @override
  List<Object?> get props => [
        id
      ];
}
