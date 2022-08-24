import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/score/key_signature.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/models/score/score_settings.dart';
import 'package:solpha/modules/models/score/time_signature.dart';
import 'package:solpha/modules/score_editor/cubit/score/score_cubit_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/track/track_cubit.dart';
import 'package:solpha/modules/score_editor/ui/widgets/track_sheet.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/music_note.dart';
import 'package:solpha/modules/score_editor/ui/widgets/keyboard/solfa_keyboard.dart';

class ScoreEditorBody extends StatelessWidget {
  const ScoreEditorBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScoreCubit, ScoreCubitState>(
      builder: (context, state) {
        var tracks = state.score.tracks;
        var noOfTracks = tracks.length;
        return SafeArea(
          child: DefaultTabController(
            length: noOfTracks,
            child: Scaffold(
              backgroundColor: Colors.white54,
              appBar: PreferredSize(
                  child: TabBar(
                    onTap: (value) {
                      context.read<ScoreCubit>().play();
                    },
                    tabs: List.generate(
                      noOfTracks,
                      (index) => Tab(
                        text: 'Track $index',
                      ),
                    ),
                  ),
                  preferredSize: Size.fromHeight(40)),
              body: TabBarView(
                children: List.generate(
                  noOfTracks,
                  (index) => BlocProvider(
                    create: (context) => TrackCubit(tracks[index]),
                    child: Column(
                      children: [
                        Expanded(
                          child: TrackSheet(),
                        ),
                        SolfaKeyboard(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
