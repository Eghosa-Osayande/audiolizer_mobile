import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file/memory.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/score_editor/service/audio_player_service.dart';

part 'score_cubit_state.dart';

class ScoreCubit extends Cubit<ScoreCubitState> {
  final Score score;
  ScoreCubit({required this.score}) : super(ScoreCubitState.random(score)) {
    score.addListener(scoreListener);
  }

  void scoreListener() {
    emit(ScoreCubitState.random(score));
  }

  void play() async {
    emit(ScoreCubitState.random(score));
    await score.commit();   

    File outputFile = MemoryFileSystem().file('${DateTime.now().millisecondsSinceEpoch}.mid');
    await score.midiFile.writeFile(outputFile);


    await AudioPlayerService.instance.setSourceBytes(await outputFile.readAsBytes());
    AudioPlayerService.instance.resume();

    emit(ScoreCubitState.random(score));
  }

  @override
  Future<void> close() {
    score.removeListener(scoreListener);
    return super.close();
  }
}
