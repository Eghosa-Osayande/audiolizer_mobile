import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audiolizer/modules/models/project/project_model.dart';

class UndoRedoCubit extends Cubit<UndoRedoState> {
  final Project project;

  UndoRedoCubit({required this.project}) : super(UndoRedoState(project));

  void undo() {
    if (project.scoreUndoVersions.isNotEmpty) {
      var score = project.scoreUndoVersions.removeLast();
      print([
        score.length,
        score.tracks.first.first.notes.length
      ]);
      project.scoreRedoVersions.add(project.score);
      project.score = score;

      emit(UndoRedoState(project));
    }
  }

  void redo() {
    if (project.scoreRedoVersions.isNotEmpty) {
      var score = project.scoreRedoVersions.removeLast();
      print([
        score.length,
        score.tracks.first.first.notes.length
      ]);
      project.scoreUndoVersions.add(project.score);
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
