import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/score/key_signature.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/models/score/score_settings.dart';
import 'package:solpha/modules/models/score/time_signature.dart';
import 'package:solpha/modules/score_editor/cubit/current_track/current_track_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/score/score_cubit_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/edit_track_notes/edit_track_note_cubit.dart';
import 'package:solpha/modules/score_editor/ui/widgets/side_drawer.dart';
import 'package:solpha/modules/score_editor/ui/widgets/toolbars/media_control_toolbar.dart';
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
          child: Scaffold(
            backgroundColor: Colors.white54,
            drawer: SideDrawer(),
            appBar: MediaControlToolbar(),
            body: BlocBuilder<CurrentTrackCubit, int>(
              builder: (context, currentTrackIndex) {
                return IndexedStack(
                  index: currentTrackIndex,
                  children: tracks.map((track) {
                    return BlocProvider(
                      create: (context) => EditTrackNotesCubit(track),
                      child: Column(
                        children: [
                          Expanded(
                            child: TrackSheet(),
                          ),
                          SolfaKeyboard(),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
