import 'package:audiolizer/modules/project_editor/cubit/current_project/current_project.dart';

import 'package:audiolizer/modules/project_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/view_mode/view_mode.dart';
import 'package:audiolizer/modules/project_editor/ui/toolbars/edit_toolbar.dart';
import 'package:audiolizer/modules/project_editor/ui/toolbars/readonly_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrimaryToolbar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryToolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ViewModeCubit, ViewModeState>(
          builder: (context, viewMode) {
            if (viewMode == ViewModeState.readOnly) {
              return ReadOnlyToolbar();
            }

            return EditToolbar();
          },
        );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight);
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
              return Icon(Icons.keyboard_alt_outlined);
          }
        },
      ),
    );
  }
}
