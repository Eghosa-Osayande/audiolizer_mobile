import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file/memory.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/score_editor/ui/widgets/keyboard/solfa_keyboard.dart';

part 'score_cubit_state.dart';

class ScoreCubit extends Cubit<ScoreCubitState> {
  final Score score;
  final player = AudioPlayer();
  ScoreCubit({required this.score}) : super(ScoreCubitState.random(score)) {
    score.addListener(scoreListener);
  }

  void scoreListener() {
    emit(ScoreCubitState.random(score));
  }

  void play() async {
     emit(ScoreCubitState.random(score));
    await score.commit();

    print(score.tracks);
    for (var v in score.tracks) {
      for (var t in v) {
        t.map(
          music: (musicNote) {
            print([
              musicNote.duration,
              musicNote.position
            ]);
          },
          duration: (durationNote) {},
          Else: (note) {},
        );
      }
    }

    File outputFile = MemoryFileSystem().file('${DateTime.now().millisecondsSinceEpoch}.mid');
    await score.midiFile.writeFile(outputFile);
    var f = outputFile;
    

    print(['ss',
      f.lengthSync(),
    ]);

    await player.setSourceBytes(f.readAsBytesSync());
    await player.resume();
     emit(ScoreCubitState.random(score));
    // await player.seek(Duration(seconds: 14));
  }

  @override
  Future<void> close() {
    score.removeListener(scoreListener);
    return super.close();
  }
}
