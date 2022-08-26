import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/score_editor/cubit/current_track_index/current_track_index_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/score/score_cubit_cubit.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: BlocBuilder<CurrentTrackIndexCubit, int>(
        builder: (context, currentIndex) {
          return BlocBuilder<ScoreCubit, ScoreCubitState>(
            builder: (context, state) {
              var tracks = state.score.tracks;
              var noOfTracks = tracks.length;
              return Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Track ${index + 1}'),
                          selected: index == currentIndex,
                          onTap: () {
                            BlocProvider.of<CurrentTrackIndexCubit>(context).setCurrentTrack(
                              index,
                              
                            );
                            Navigator.pop(context);
                          },
                        );
                      },
                      itemCount: noOfTracks,
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
