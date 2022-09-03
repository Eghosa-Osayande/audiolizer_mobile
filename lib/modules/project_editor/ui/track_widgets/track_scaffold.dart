import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/project_editor/cubit/current_project/current_project.dart';
import 'package:solpha/modules/project_editor/cubit/edit_project/edit_project_cubit.dart';
import 'package:solpha/modules/project_editor/cubit/focused_bar/focused_bar_cubit.dart';
import 'package:solpha/modules/project_editor/cubit/keyboard_event/keyboard_event.dart';
import 'package:solpha/modules/project_editor/cubit/play_score/play_score_cubit.dart';
import 'package:solpha/modules/project_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';
import 'package:solpha/modules/project_editor/cubit/undo_redo/undo_redo_cubit.dart';
import 'package:solpha/modules/project_editor/ui/keyboard/solfa_keyboard.dart';
import 'package:solpha/modules/project_editor/ui/toolbars/playback_slider.dart';
import 'package:solpha/modules/project_editor/ui/toolbars/primary_toolbar.dart';
import 'package:solpha/modules/project_editor/ui/track_widgets/bar_group.dart';
import 'package:solpha/modules/themes/colors/app_colors.dart';

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
      child: Scaffold(
        appBar: PrimaryToolbar(),
        body: Scaffold(
          appBar: ToolbarPlaybackProgress(),
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
                        BlocListener<PlayScoreCubit, PlayScoreCubitState?>(
                          listener: (context, state) {
                            if (state?.score.errorObj != null) {
                              var errorTrack = state?.score.errorObj;
                              showDialog(
                                context: context,
                                builder: (context) {
                                  String? errorTrackName = errorTrack?.name;
                                  int? errorTrackIndex = errorTrack?.errorIndex;

                                  Bar? errorBar = errorTrack?.errorObj;
                                  int? errorBarIndex = errorTrack?.errorObj?.errorIndex;

                                  Note? errorNote = errorTrack?.errorObj?.errorObj;

                                  String start = '';
                                  String? mid;
                                  String end = '';

                                  for (Note note in errorBar?.notes ?? []) {
                                    if (note == errorNote) {
                                      mid = note.displayString();
                                      continue;
                                    }
                                    if (mid != null) {
                                      end = end + note.displayString();
                                    } else {
                                      start = start + note.displayString();
                                    }
                                  }
                                  return AlertDialog(
                                    title: Text('Compile error'),
                                    content: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(text: 'Issue on track  "$errorTrackName"\n\n'),
                                          WidgetSpan(
                                            child: Container(
                                              padding: EdgeInsets.all(4),
                                              color: AppColors.instance.black,
                                              child: Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(text:'Bar $errorTrackIndex ==> '),
                                                    TextSpan(text: start),
                                                    WidgetSpan(
                                                      child: Container(
                                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                                        decoration: BoxDecoration(
                                                          color: AppColors.instance.accentError,
                                                        ),
                                                        child: Text.rich(
                                                          TextSpan(text: mid),
                                                        ),
                                                      ),
                                                    ),
                                                    TextSpan(text: end),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                           TextSpan(text: '\n\n${errorBar?.errorMessage??''}'),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ],
                      child: BlocBuilder<UndoRedoCubit, UndoRedoState>(
                        builder: (context, undoRedoState) {
                          var tracks = undoRedoState.project.score.tracks;

                          return ListView.builder(
                            itemCount: undoRedoState.project.score.trackBarCount,
                            itemBuilder: (context, barIndex) {
                              var bars = List.generate(
                                tracks.length,
                                (trackIndex) {
                                  var bar = tracks.toList()[trackIndex].bars.toList()[barIndex];
                                  return bar;
                                },
                              );
                              return BarGroupWidget(
                                barIndex: barIndex,
                                bars: bars,
                              );
                            },
                          );
                        },
                      ),
                    )),
              ),
              SolfaKeyboard(),
            ],
          ),
        ),
      ),
    );
  }
}
