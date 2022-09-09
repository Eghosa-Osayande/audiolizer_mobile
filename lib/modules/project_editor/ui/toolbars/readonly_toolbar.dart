import 'package:audiolizer/modules/common/widgets/project_bottom_sheet.dart';
import 'package:audiolizer/modules/common/widgets/toolbar_options.dart';
import 'package:audiolizer/modules/pdf/ui/pdf_preview.dart';
import 'package:audiolizer/modules/project_editor/cubit/current_project/current_project.dart';
import 'package:audiolizer/modules/project_editor/cubit/play_score/play_score_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_edit_play_mode/toggle_edit_play_mode_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_metroneme/toggle_metroneme.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_playback_progress_visibility/toggle_playback_progress_visibility.dart';
import 'package:audiolizer/modules/project_editor/cubit/view_mode/view_mode.dart';
import 'package:audiolizer/modules/project_editor/ui/toolbars/primary_toolbar.dart';
import 'package:audiolizer/modules/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Function(dynamic)? getSelectedFuction(BuildContext context) {
  return (dynamic value) {
    switch (value) {
      case 'pdf':
        var project = BlocProvider.of<CurrentProjectCubit>(context).state;
        Navigator.push(context, ScorePdfPreview.route(project: project));
    }
  };
}

List<PopupMenuItem<dynamic>> popupItemsReadOnly(BuildContext cubitContext) => [
      // PopupMenuItem(
      //   child: ToolbarOption(
      //     title: 'Metroneme',
      //     trailing: BlocProvider(
      //       create: (context) => ToggleMetronemeCubit(),
      //       child: Builder(builder: (context) {
      //         return BlocBuilder<ToggleMetronemeCubit, bool>(
      //           builder: (context, state) {
      //             return Checkbox(
      //                 value: state,
      //                 onChanged: (bool? value) {
      //                   if (value != null) {
      //                     BlocProvider.of<ToggleMetronemeCubit>(context).toggle(value);
      //                   }
      //                   Navigator.pop(context);
      //                 });
      //           },
      //         );
      //       }),
      //     ),
      //   ),
      // ),

      PopupMenuItem(
        value: 'pdf',
        child: Builder(builder: (context) {
          return ToolbarOption(
            title: 'Share as PDF',
            trailing: Icon(Icons.picture_as_pdf),
          );
        }),
      ),
      PopupMenuItem(
        onTap: () {
          BlocProvider.of<TogglePlayBackProgressCubit>(cubitContext).toggle();
        },
        child: Builder(builder: (context) {
          return ToolbarOption(
            title: 'Show Progress',
            trailing: Checkbox(
                value: BlocProvider.of<TogglePlayBackProgressCubit>(cubitContext).state,
                onChanged: (bool? value) {
                  BlocProvider.of<TogglePlayBackProgressCubit>(cubitContext).toggle();
                  Navigator.pop(context);
                }),
          );
        }),
      ),
    ];

class ReadOnlyToolbar extends StatelessWidget {
  const ReadOnlyToolbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var project = BlocProvider.of<CurrentProjectCubit>(context).state;
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        Expanded(
          child: Text(
            project.title,
            style: TextStyle(fontSize: 20),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Spacer(),
        BlocBuilder<ViewModeCubit, ViewModeState>(
          builder: (context, viewMode) {
            if (viewMode == ViewModeState.readOnly) {
              return IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  BlocProvider.of<ViewModeCubit>(context).edit();
                },
              );
            }
            return SizedBox();
          },
        ),
        PopupMenuButton(
           onSelected: getSelectedFuction(context),
          itemBuilder: (context) {
            return [
              ...popupItemsReadOnly(context),
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
    );
  }
}
