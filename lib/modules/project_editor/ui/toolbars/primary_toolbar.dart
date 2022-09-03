import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/project_editor/cubit/current_project/current_project.dart';
import 'package:solpha/modules/project_editor/cubit/edit_project/edit_project_cubit.dart';
import 'package:solpha/modules/project_editor/cubit/play_score/play_score_cubit.dart';
import 'package:solpha/modules/project_editor/cubit/toggle_edit_play_mode/toggle_edit_play_mode_cubit.dart';
import 'package:solpha/modules/project_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';
import 'package:solpha/modules/project_editor/cubit/toggle_metroneme/toggle_metroneme.dart';
import 'package:solpha/modules/project_editor/cubit/undo_redo/undo_redo_cubit.dart';
import 'package:solpha/modules/project_editor/cubit/volume_navigation/volume_navigation_cubit.dart';
import 'package:solpha/modules/themes/colors/app_colors.dart';

class PrimaryToolbar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryToolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProjectCubit, EditProjectCubitState>(
      builder: (context, state) {
        var project = BlocProvider.of<CurrentProjectCubit>(context).state;
        return Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
            Text(
              project.titleShort(7, delimiter: '...'.toUpperCase()),
              style: TextStyle(fontSize: 20),
            ),
            Spacer(),
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
      },
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight);
  }
}

class ToolbarOption extends StatelessWidget {
  final String title;
  final Widget? trailing;

  const ToolbarOption({
    Key? key,
    required this.title,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(title),
          Spacer(),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

class KeyboardVisibilityToggler extends StatelessWidget {
  const KeyboardVisibilityToggler({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<ToggleSolfaKeyboardVisibilityCubit>(context).toggle();
      },
      icon: BlocBuilder<ToggleSolfaKeyboardVisibilityCubit, SolfaKeyboardVisibility>(
        builder: (context, state) {
          switch (state) {
            case SolfaKeyboardVisibility.visible:
              return Icon(Icons.keyboard);

            case SolfaKeyboardVisibility.hidden:

            case SolfaKeyboardVisibility.hiddenForSytemUI:
              return Icon(Icons.keyboard_alt_outlined);
          }
        },
      ),
    );
  }
}
