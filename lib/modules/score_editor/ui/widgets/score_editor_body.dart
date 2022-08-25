import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/score_editor/cubit/current_track/current_track_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/edit_track_notes/edit_track_note_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/score/score_cubit_cubit.dart';
import 'package:solpha/modules/score_editor/ui/widgets/track_sheet.dart';

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
            body: BlocBuilder<CurrentTrackCubit, int>(
              builder: (context, currentTrackIndex) {
                return IndexedStack(
                  index: currentTrackIndex,
                  children: tracks.map((track) {
                    return BlocProvider(
                      create: (context) => EditTrackNotesCubit(track),
                      child: TrackSheet(),
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
