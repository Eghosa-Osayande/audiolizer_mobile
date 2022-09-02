part of 'edit_project_cubit.dart';

class EditProjectCubitState with EquatableMixin {
  late final int id = DateTime.now().millisecondsSinceEpoch;
  final Project project;
 
  EditProjectCubitState(
    this.project,
    
  );

  @override
  List<Object?> get props => [
        id
      ];
}
