part of 'reload_project.dart';

class ReloadProjectCubitState with EquatableMixin {
  late final int id = DateTime.now().millisecondsSinceEpoch;
  final Project project;

  ReloadProjectCubitState(
    this.project,
  );

  @override
  List<Object?> get props => [
        id
      ];
}
