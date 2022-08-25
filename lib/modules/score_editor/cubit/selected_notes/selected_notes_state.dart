part of 'selected_notes_cubit.dart';

class SelectedNotesState with EquatableMixin {
  final bool enabled;
  final int count;
  
  const SelectedNotesState(this.enabled, this.count);

  @override
  List<Object?> get props => [enabled,count];
}
