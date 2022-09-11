import 'package:audiolizer/modules/project_editor/cubit/current_project/current_project.dart';
import 'package:audiolizer/modules/project_editor/cubit/focused_bar/focused_bar_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/keyboard_event/keyboard_event.dart';
import 'package:audiolizer/modules/project_editor/cubit/play_score/play_score_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_auto_scroll/toggle_auto_scroll.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_edit_play_mode/toggle_edit_play_mode_cubit.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: PrimaryToolbar(),
        body: Scaffold(
          appBar: ToolbarPlaybackProgress(),
          floatingActionButton: BlocBuilder<ViewModeCubit, ViewModeState>(
            builder: (context, viewMode) {
              if (viewMode == ViewModeState.readOnly) {
                return FloatingActionButton(
                  backgroundColor: AppColors.instance.primary,
                  foregroundColor: AppColors.instance.iconLight,
                  onPressed: () {
                    BlocProvider.of<PlayScoreCubit>(context).play();
                  },
                  child: BlocBuilder<ToggleEditPlayModeCubit, ToggleEditPlayModeState>(
                    builder: (context, state) {
                      switch (state) {
                        case ToggleEditPlayModeState.edit:
                          return Icon(Icons.play_arrow);

                        case ToggleEditPlayModeState.playing:
                          return Icon(Icons.pause);
                      }
                    },
                  ),
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
                      BlocListener<ToggleEditPlayModeCubit, ToggleEditPlayModeState>(
                        listener: (context, state) {
                          switch (state) {
                            case ToggleEditPlayModeState.edit:
                              break;

                            case ToggleEditPlayModeState.playing:
                              BlocProvider.of<ToggleAutoScrollCubit>(context).itemScrollController.scrollTo(
                                  index: 0,
                                  duration: Duration(
                                    milliseconds: 500,
                                  ));
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
    );
  }
}
