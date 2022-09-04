import 'package:audiolizer/modules/project_editor/cubit/current_project/current_project.dart';
import 'package:audiolizer/modules/project_editor/cubit/focused_bar/focused_bar_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/keyboard_event/keyboard_event.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/undo_redo/undo_redo_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/view_mode/view_mode.dart';
import 'package:audiolizer/modules/project_editor/ui/keyboard/solfa_keyboard.dart';
import 'package:audiolizer/modules/project_editor/ui/toolbars/playback_slider.dart';
import 'package:audiolizer/modules/project_editor/ui/toolbars/primary_toolbar.dart';
import 'package:audiolizer/modules/project_editor/ui/track_widgets/compile_error_dialog.dart';
import 'package:audiolizer/modules/project_editor/ui/track_widgets/tracklist_view.dart';
import 'package:audiolizer/modules/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackScaffold extends StatefulWidget {
  const TrackScaffold({
    Key? key,
  }) : super(key: key);

  @override
  State<TrackScaffold> createState() => _TrackScaffoldState();
}

class _TrackScaffoldState extends State<TrackScaffold> {
  @override
  void initState() {
    super.initState();
    context.read<SolfaKeyBoardInputEventCubit>().addBarWhenEmpty();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<FocusedBarCubit>(context).unfocusBar();
        BlocProvider.of<ToggleSolfaKeyboardVisibilityCubit>(context).hide();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: PrimaryToolbar(),
          body: Scaffold(
            appBar: ToolbarPlaybackProgress(),
            floatingActionButton: BlocBuilder<ViewModeCubit, ViewModeState>(
              builder: (context, viewMode) {
                if (viewMode == ViewModeState.readOnly) {
                  return FloatingActionButton(
                    child: Icon(Icons.edit),
                    backgroundColor: AppColors.instance.primary,
                    onPressed: () {
                      BlocProvider.of<ViewModeCubit>(context).edit();
                    },
                  );
                }
                return SizedBox();
              },
            ),
            body: Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: MultiBlocListener(
                      listeners: [
                        BlocListener<SolfaKeyBoardInputEventCubit, SolfaKeyBoardInputEvent?>(
                          listener: (context, state) {
                            if (state != null) {
                              switch (state.name) {
                                case SolfaKeyBoardInputEventName.insert:
                                  break;
                                case SolfaKeyBoardInputEventName.delete:
                                  break;
                                case SolfaKeyBoardInputEventName.addBar:
                                  setState(() {});
                                  break;
                                case SolfaKeyBoardInputEventName.deleteBar:
                                  if (context.read<CurrentProjectCubit>().state.score.tracks.first.bars.isEmpty) {
                                    context.read<SolfaKeyBoardInputEventCubit>().addBarWhenEmpty();
                                  }
                                  setState(() {});
                                  break;
                                case SolfaKeyBoardInputEventName.selectAll:
                                  // TODO: Handle this case.
                                  break;
                              }
                            }
                          },
                        ),
                        BlocListener<ViewModeCubit, ViewModeState>(
                          listener: (context, viewMode) {
                            switch (viewMode) {
                              case ViewModeState.readOnly:
                                BlocProvider.of<ToggleSolfaKeyboardVisibilityCubit>(context).hide();
                                break;
                              case ViewModeState.edit:
                                BlocProvider.of<ToggleSolfaKeyboardVisibilityCubit>(context).open();
                                break;
                            }
                          },
                        ),
                      ],
                      child: CompileErrorDialog(
                        child: BlocBuilder<UndoRedoCubit, UndoRedoState>(
                          builder: (context, undoRedoState) {
                            var tracks = undoRedoState.project.score.tracks;

                            var trackBarCount2 = undoRedoState.project.score.trackBarCount;
                            return TrackListView(trackBarCount2: trackBarCount2, tracks: tracks);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SolfaKeyboard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
