import 'package:audiolizer/modules/common/widgets/toolbar_options.dart';
import 'package:audiolizer/modules/models/project/project_model.dart';
import 'package:audiolizer/modules/project_editor/ui/toolbars/primary_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:audiolizer/modules/models/score/score.dart';
import 'package:audiolizer/modules/project_editor/cubit/current_project/current_project.dart';
import 'package:audiolizer/modules/project_editor/cubit/edit_project/edit_project_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/play_score/play_score_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_edit_play_mode/toggle_edit_play_mode_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_metroneme/toggle_metroneme.dart';
import 'package:audiolizer/modules/project_editor/cubit/undo_redo/undo_redo_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/view_mode/view_mode.dart';
import 'package:audiolizer/modules/project_editor/cubit/volume_navigation/volume_navigation_cubit.dart';
import 'package:audiolizer/modules/project_management/manage_score_settings/ui/create_project_page.dart';
import 'package:audiolizer/modules/themes/colors/app_colors.dart';


class EditToolbar extends StatelessWidget {
  const EditToolbar({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var project = BlocProvider.of<CurrentProjectCubit>(context).state;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WillPopScope(
          onWillPop: () async {
            BlocProvider.of<ViewModeCubit>(context).readonly();
            return false;
          },
          child: IconButton(
              onPressed: () {
                BlocProvider.of<ViewModeCubit>(context).readonly();
              },
              icon: Icon(Icons.check)),
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.of(context).push(CreateProjectPage.route(project: project));
          },
        ),
        BlocBuilder<UndoRedoCubit, UndoRedoState>(
          builder: (context, state) {
            return IconButton(
              onPressed: project.scoreUndoVersions.isEmpty
                  ? null
                  : () {
                      BlocProvider.of<UndoRedoCubit>(context).undo();
                    },
              icon: Icon(
                Icons.undo,
              ),
            );
          },
        ),
        BlocBuilder<UndoRedoCubit, UndoRedoState>(
          builder: (context, state) {
            return IconButton(
              onPressed: project.scoreRedoVersions.isEmpty
                  ? null
                  : () {
                      BlocProvider.of<UndoRedoCubit>(context).redo();
                    },
              icon: Icon(
                Icons.redo,
              ),
            );
          },
        ),
        IconButton(
          onPressed: () {
            BlocProvider.of<PlayScoreCubit>(context).play();
          },
          icon: BlocBuilder<ToggleEditPlayModeCubit, ToggleEditPlayModeState>(
            builder: (context, state) {
              switch (state) {
                case ToggleEditPlayModeState.edit:
                  return Icon(Icons.play_arrow);

                case ToggleEditPlayModeState.playing:
                  return Icon(Icons.pause);
              }
            },
          ),
        ),
        PopupMenuButton(
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: ToolbarOption(
                  title: 'Volume Navigation',
                  trailing: BlocProvider(
                    create: (context) => VolumeNavigationCubit(),
                    child: Builder(builder: (context) {
                      return BlocBuilder<VolumeNavigationCubit, bool>(
                        builder: (context, state) {
                          return Checkbox(
                              value: state,
                              onChanged: (bool? value) {
                                if (value != null) {
                                  BlocProvider.of<VolumeNavigationCubit>(context).toggle(value);
                                }
                                Navigator.pop(context);
                              });
                        },
                      );
                    }),
                  ),
                ),
              ),
              PopupMenuItem(
                child: ToolbarOption(
                  title: 'Metroneme',
                  trailing: BlocProvider(
                    create: (context) => ToggleMetronemeCubit(),
                    child: Builder(builder: (context) {
                      return BlocBuilder<ToggleMetronemeCubit, bool>(
                        builder: (context, state) {
                          return Checkbox(
                              value: state,
                              onChanged: (bool? value) {
                                if (value != null) {
                                  BlocProvider.of<ToggleMetronemeCubit>(context).toggle(value);
                                }
                                Navigator.pop(context);
                              });
                        },
                      );
                    }),
                  ),
                ),
              ),
            ];
          },
          icon: Icon(
            Icons.more_vert,
          ),
        ),
      ],
    );
  }
}

