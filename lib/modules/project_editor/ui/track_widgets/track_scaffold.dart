import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/project_editor/cubit/keyboard_event/keyboard_event.dart';
import 'package:solpha/modules/project_editor/cubit/undo_redo/undo_redo_cubit.dart';
import 'package:solpha/modules/project_editor/ui/keyboard/solfa_keyboard.dart';
import 'package:solpha/modules/project_editor/ui/toolbars/playback_slider.dart';
import 'package:solpha/modules/project_editor/ui/toolbars/primary_toolbar.dart';
import 'package:solpha/modules/project_editor/ui/track_widgets/bar_group.dart';

class TrackScaffold extends StatefulWidget {
  const TrackScaffold({
    Key? key,
  }) : super(key: key);

  @override
  State<TrackScaffold> createState() => _TrackScaffoldState();
}

class _TrackScaffoldState extends State<TrackScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                setState(() {});
                                break;
                            }
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
    );
  }
}
