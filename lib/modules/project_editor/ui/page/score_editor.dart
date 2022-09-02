import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/project/project_model.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/project_editor/cubit/current_project/current_project.dart';
import 'package:solpha/modules/project_editor/cubit/edit_project/edit_project_cubit.dart';
import 'package:solpha/modules/project_editor/cubit/focused_bar/focused_bar_cubit.dart';
import 'package:solpha/modules/project_editor/cubit/keyboard_event/keyboard_event.dart';
import 'package:solpha/modules/project_editor/cubit/play_score/play_score_cubit.dart';
import 'package:solpha/modules/project_editor/cubit/toggle_edit_play_mode/toggle_edit_play_mode_cubit.dart';
import 'package:solpha/modules/project_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';
import 'package:solpha/modules/project_editor/cubit/undo_redo/undo_redo_cubit.dart';
import 'package:solpha/modules/project_editor/cubit/volume_navigation/volume_navigation_cubit.dart';
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
          create: (context) => CurrentProjectCubit(project),
        ),
        BlocProvider(
          create: (context) => PlayScoreCubit(project: project),
        ),
        BlocProvider(
          create: (context) => EditProjectCubit(project: project),
        ),
        BlocProvider(
          create: (context) => UndoRedoCubit(project: project),
        ),
        BlocProvider(
          create: (context) => ToggleEditPlayModeCubit(),
        ),
        BlocProvider(
          create: (context) => ToggleSolfaKeyboardVisibilityCubit(),
        ),
        BlocProvider(
          create: (context) => SolfaKeyBoardInputEventCubit(project),
        ),
        BlocProvider(
          create: (context) => FocusedBarCubit(),
        ),
        BlocProvider(
          create: (context) => VolumeNavigationCubit(),
        ),
      ],
      child: ScoreEditorBody(),
    );
  }
}
