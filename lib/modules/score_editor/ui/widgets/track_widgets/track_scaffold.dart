import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/track/track.dart';
import 'package:solpha/modules/score_editor/cubit/score/score_cubit_cubit.dart';
import 'package:solpha/modules/score_editor/ui/widgets/keyboard/solfa_keyboard.dart';
import 'package:solpha/modules/score_editor/ui/widgets/toolbars/playback_slider.dart';
import 'package:solpha/modules/score_editor/ui/widgets/toolbars/primary_toolbar.dart';
import 'package:solpha/modules/score_editor/ui/widgets/track_widgets/bar_group.dart';
import 'package:solpha/modules/score_editor/ui/widgets/track_widgets/track_bar.dart';
import 'package:solpha/modules/score_editor/ui/widgets/track_widgets/track_drawer.dart';

class TrackScaffold extends StatefulWidget {
  const TrackScaffold({
    Key? key,
  }) : super(key: key);

  @override
  State<TrackScaffold> createState() => _TrackScaffoldState();
}

class _TrackScaffoldState extends State<TrackScaffold> {
  final GlobalKey keyboardKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        drawer: SideDrawer(),
        appBar: PrimaryToolbar(),
        body: Scaffold(
          appBar: ToolbarPlaybackProgress(),
          body: Column(
            children: [
              Expanded(
                child: Align(
                    alignment: Alignment.topLeft,
                    child: BlocBuilder<ScoreCubit, ScoreCubitState>(
                      builder: (context, scoreCubitState) {
                        var tracks = scoreCubitState.score.tracks;
                        return ListView.builder(
                          itemCount: scoreCubitState.score.trackBarCount,
                          itemBuilder: (context, barIndex) {
                            var bars = List.generate(
                              tracks.length,
                              (trackIndex) {
                                var bar = tracks[trackIndex].bars.toList()[barIndex];
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
                    )),
              ),
              SolfaKeyboard(
                key: keyboardKey,
              ),
            ],
          ),
        ),
      );
    });
  }
}
