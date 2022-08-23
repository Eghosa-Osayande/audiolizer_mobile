part of 'score_cubit_cubit.dart';

class ScoreCubitState with EquatableMixin {
  final int id;
  final Score score;
  const ScoreCubitState(this.id, this.score);

  factory ScoreCubitState.random(Score score) {
    return ScoreCubitState(
      DateTime.now().microsecondsSinceEpoch,
      score,
    );
  }

  @override
  List<Object?> get props => [id];
}
