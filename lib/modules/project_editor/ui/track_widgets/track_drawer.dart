import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/project_editor/cubit/score/score_cubit_cubit.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: BlocBuilder<ScoreCubit, ScoreCubitState>(
        builder: (context, state) {
          var tracks = state.score.tracks;
          var noOfTracks = tracks.length;
          return Column(
            children: [
              SizedBox(
                height: 20,
              ),
            ],
          );
        },
      ),
    );
  }
}
