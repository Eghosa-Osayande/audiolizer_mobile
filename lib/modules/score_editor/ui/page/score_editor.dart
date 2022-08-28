import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/score_editor/cubit/score/score_cubit_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/toggle_edit_lyrics/toggle_can_see_lyrics_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/toggle_edit_play_mode/toggle_edit_play_mode_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';
import 'package:solpha/modules/score_editor/ui/widgets/score_editor_body.dart';

class ScoreEditorPage extends StatelessWidget {
  final Score score;
  const ScoreEditorPage({Key? key, required this.score}) : super(key: key);

  static String path = '/score_editor';

  static Route route(Score score) {
    return MaterialPageRoute(
      settings: RouteSettings(name: path),
      builder: (_) =>  ScoreEditorPage(score: score),
    );
  }

  @override
  Widget build(BuildContext context) {
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
