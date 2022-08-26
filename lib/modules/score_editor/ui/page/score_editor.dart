import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/notes/config_notes.dart';
import 'package:solpha/modules/models/score/key_signature.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/models/score/time_signature.dart';
import 'package:solpha/modules/score_editor/cubit/current_track_index/current_track_index_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/score/score_cubit_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/toggle_edit_lyrics/toggle_can_edit_lyrics_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/toggle_edit_lyrics/toggle_can_see_lyrics_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/toggle_edit_play_mode/toggle_edit_play_mode_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';
import 'package:solpha/modules/score_editor/ui/widgets/score_editor_body.dart';

class ScoreEditorPage extends StatelessWidget {
  const ScoreEditorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScoreConfigNote intialSettings = ScoreConfigNote(
      bpm: 120,
      timeSignature: TimeSignature.t_4_4,
      keySignature: KeySignature.gmajor,
      tonicPitchNumber: 3,
    );

    Score score = Score(
      intialConfigNote: intialSettings,
    );

    score.createTrack(trackNumber: 0);
    score.createTrack(trackNumber: 1);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ScoreCubit(score: score),
        ),
        BlocProvider(
          create: (context) => ToggleEditPlayModeCubit(),
        ),
        BlocProvider(
          create: (context) => ToggleKeyboardVisibilityCubit(),
        ),
        BlocProvider(
          create: (context) => CanSeeLyricsCubit(),
        ),
       
      ],
      child: ScoreEditorBody(),
    );
  }
}
