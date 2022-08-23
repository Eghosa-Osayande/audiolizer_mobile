import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/score/key_signature.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/models/score/score_settings.dart';
import 'package:solpha/modules/models/score/time_signature.dart';
import 'package:solpha/modules/score_editor/cubit/score/score_cubit_cubit.dart';
import 'package:solpha/modules/score_editor/ui/widgets/score_editor_body.dart';

class ScoreEditorPage extends StatelessWidget {
  const ScoreEditorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScoreSettings intialSettings = ScoreSettings(
      bpm: 120,
      timeSignature: TimeSignature.t_4_4,
      keySignature: KeySignature.gmajor,
      tonicPitchNumber: 3,
    );
    Score score = Score(
      intialSettings: intialSettings,
    );
    score.createTrack(trackNumber: 0);
    // score.createTrack(trackNumber: 1);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ScoreCubit(score: score),
        ),
      ],
      child:ScoreEditorBody(),
      
    );
  }
}
