import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file/memory.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/score_editor/service/audio_player_service.dart';
import 'package:solpha/modules/score_editor/ui/widgets/solfa_text_field/solfa_input_controller.dart';

part 'score_cubit_state.dart';

class ScoreCubit extends Cubit<ScoreCubitState> {
  final Score score;

  File? outputFile;

  

  ScoreCubit({required this.score}) : super(ScoreCubitState.random(score));

  void play() async {
    if (AudioPlayerService.instance.isPlaying) {
      AudioPlayerService.instance.pause();
    } else {
      emit(ScoreCubitState.random(score));

      var result = await score.commit();

      if (result != null) {
        if (result.isSuccess) {
        
          await AudioPlayerService.instance.setSourceBytes(await result.success.readAsBytes());
          await AudioPlayerService.instance.seek(Duration(seconds: 0));
          AudioPlayerService.instance.resume();
          return;
        } else {
         
          return;
        }
      }
      AudioPlayerService.instance.resume();

      emit(ScoreCubitState.random(score));
    }
  }

  @override
  Future<void> close() {
    
    return super.close();
  }
}
