part of 'play_score_cubit.dart';

class PlayScoreCubitState with EquatableMixin {
  late final int id = DateTime.now().millisecondsSinceEpoch;
  final Score score;
  PlayScoreCubitState(this.score);

  @override
  List<Object?> get props => [
        id
      ];
}
