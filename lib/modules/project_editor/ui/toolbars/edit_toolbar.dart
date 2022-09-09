import 'package:audiolizer/modules/common/widgets/project_bottom_sheet.dart';
import 'package:audiolizer/modules/common/widgets/toolbar_options.dart';
import 'package:audiolizer/modules/models/project/project_model.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_playback_progress_visibility/toggle_playback_progress_visibility.dart';
import 'package:audiolizer/modules/project_editor/ui/toolbars/primary_toolbar.dart';
import 'package:audiolizer/modules/project_editor/ui/toolbars/readonly_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:audiolizer/modules/models/score/score.dart';
import 'package:audiolizer/modules/project_editor/cubit/current_project/current_project.dart';

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
    return Container(
      decoration: BoxDecoration(color: AppColors.instance.black),
      child: Row(
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
          Builder(
            builder: (context) {
              return IconButton(
                onPressed: BlocProvider.of<UndoRedoCubit>(context, listen: true).projectUndoVersions.isEmpty
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
          Builder(
            builder: (context) {
              return IconButton(
                onPressed: BlocProvider.of<UndoRedoCubit>(context, listen: true).projectRedoVersions.isEmpty
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
            onSelected: getSelectedFuction(context),
            itemBuilder: (context) {
              return [
                ...popupItemsReadOnly(context),
                PopupMenuItem(
                  onTap: () {
                    BlocProvider.of<VolumeNavigationCubit>(context).toggle();
                   
                  },
                  child: Builder(
                    builder: (_) {
                      return ToolbarOption(
                        title: 'Volume Navigation',
                        trailing: Checkbox(
                            value: BlocProvider.of<VolumeNavigationCubit>(context).state,
                            onChanged: (bool? value) {
                              BlocProvider.of<VolumeNavigationCubit>(context).toggle();
                              Navigator.pop(_);
                            }),
                      );
                    }
                  ),
                ),
                PopupMenuItem(
                  onTap: () {
                    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ProjectBottomSheet(project: project);
                        },
                      );
                    });
                  },
                  child: ToolbarOption(
                    title: 'More',
                  ),
                ),
              ];
            },
            icon: Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
    );
  }
}
