import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/project/project_model.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/project_editor/cubit/focused_bar/focused_bar_cubit.dart';
import 'package:solpha/modules/project_editor/cubit/keyboard_event/keyboard_event.dart';
import 'package:solpha/modules/project_editor/cubit/score/score_cubit_cubit.dart';
import 'package:solpha/modules/project_editor/cubit/toggle_edit_play_mode/toggle_edit_play_mode_cubit.dart';
import 'package:solpha/modules/project_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';
import 'package:solpha/modules/project_editor/ui/score_editor_body.dart';

class ProjectEditorPage extends StatelessWidget {
  final Project project;
  const ProjectEditorPage({Key? key, required this.project}) : super(key: key);

  static String path = '/score_editor';

  static Route route(Project project) {
    return MaterialPageRoute(
      settings: RouteSettings(name: path),
      builder: (_) => ProjectEditorPage(project: project),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ScoreCubit(score: project.score),
        ),
        BlocProvider(
          create: (context) => ToggleEditPlayModeCubit(),
        ),
        BlocProvider(
          create: (context) => ToggleKeyboardVisibilityCubit(),
        ),
        BlocProvider(
          create: (context) => SolfaKeyBoardInputEventCubit(),
        ),
        BlocProvider(
          create: (context) => FocusedBarCubit(),
        ),
      ],
      child: ScoreEditorBody(),
    );
  }
}
