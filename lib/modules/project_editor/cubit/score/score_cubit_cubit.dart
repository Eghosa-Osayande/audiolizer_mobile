import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/models/track/track.dart';
import 'package:solpha/modules/project_editor/service/audio_player_service.dart';

part 'score_cubit_state.dart';

class ScoreCubit extends Cubit<ScoreCubitState> {
  final Score score;

  File? outputFile;

  ScoreCubit({required this.score}) : super(ScoreCubitState(score));

  void play() async {
    if (AudioPlayerService.instance.isPlaying) {
      AudioPlayerService.instance.pause();
    } else {
      emit(ScoreCubitState(score));

      var result = await score.commit();

      if (result != null) {
        if (result.isSuccess) {
          score.save();
          await AudioPlayerService.instance.setSourceBytes(await result.success.readAsBytes());
          await AudioPlayerService.instance.seek(Duration(seconds: 0));
          AudioPlayerService.instance.resume();
          return;
        } else {
          return;
        }
      }
      AudioPlayerService.instance.resume();

      emit(ScoreCubitState(score));
    }
  }

  Bar addBar(Bar bar) {
    var track = (bar.list as Track);
    var index = track.toList().indexOf(bar);

    for (var track in score.tracks) {
      Bar bar = track.last;
      if (!index.isNegative) {
        bar = track.toList()[index];
      }

      bar.insertAfter(
        Bar(
          createdAt: DateTime.now().toUtc(),
          notes: [],
        ),
      );
    }
    emit(ScoreCubitState(score));
    return bar.next!;
  }

  deleteBars(List<Bar> bars) {
    for (var bar in bars) {
      bar.unlink();
    }
    emit(ScoreCubitState(score));
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
