import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:audiolizer/modules/models/project/project_model.dart';
import 'package:audiolizer/modules/models/score/score.dart';
import 'package:audiolizer/modules/project_editor/repo/toggle_metroneme.dart';
import 'package:audiolizer/modules/project_editor/service/audio_player_service.dart';

part 'play_score_cubit_state.dart';

class PlayScoreCubit extends Cubit<PlayScoreCubitState> {
  final Project project;

  PlayScoreCubit({required this.project}) : super(PlayScoreCubitState(project.score));

  void play() async {
    if (AudioPlayerService.instance.isPlaying) {
      AudioPlayerService.instance.pause();
    } else {
      emit(PlayScoreCubitState(project.score));
      var useMetro = await ToggleMetronemeRepo.instance.read();
      var result = await project.score.commit(useMetroneme: useMetro);

      if (result != null) {
        if (result.isSuccess) {
          await project.save();
          await AudioPlayerService.instance.setSourceBytes(await result.success.readAsBytes());
          await AudioPlayerService.instance.seek(Duration(seconds: 0));
          AudioPlayerService.instance.resume();
          emit(PlayScoreCubitState(project.score));
          return;
        } else {
          emit(PlayScoreCubitState(project.score));
          return;
        }
      }
      AudioPlayerService.instance.resume();

      emit(PlayScoreCubitState(project.score));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
