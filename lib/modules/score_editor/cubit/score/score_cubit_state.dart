part of 'score_cubit_cubit.dart';

class ScoreCubitState with EquatableMixin {
  late final int id = DateTime.now().millisecondsSinceEpoch;
  final Score score;
  ScoreCubitState(this.score);

  @override
  List<Object?> get props => [
        id
      ];
}
