import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/score_editor/cubit/current_bar_key/current_bar_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/single_track/single_track_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/toggle_edit_lyrics/toggle_can_edit_lyrics_cubit.dart';
import 'package:solpha/modules/score_editor/ui/widgets/keyboard/solfa_keyboard.dart';
import 'package:solpha/modules/score_editor/ui/widgets/toolbars/playback_slider.dart';
import 'package:solpha/modules/score_editor/ui/widgets/toolbars/primary_toolbar.dart';
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
    var track = BlocProvider.of<SingleTrackCubit>(context, listen: true).track;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CurrentBarCubit(),
        ),
      ],
      child: Builder(builder: (context) {
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
                      child: BlocBuilder<CurrentBarCubit, Bar?>(
                        builder: (context, state) {
                          return ListView.builder(
                            itemCount: track.bars.length,
                            itemBuilder: (context, index) {
                              var bar = track.bars.toList()[index];
                              return BlocProvider(
                                create: (context) => CanEditLyricsCubit(bar),
                                child: TrackBarWidget(
                                  key: ObjectKey(bar),
                                  bar: bar,
                                  index: index,
                                ),
                              );
                            },
                          );
                        },
                      )),
                ),
                BlocBuilder<CurrentBarCubit, Bar?>(
                  builder: (context, key) {
                    return SolfaKeyboard(key: keyboardKey,);
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
