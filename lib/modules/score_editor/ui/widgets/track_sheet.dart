import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/score_editor/cubit/track/track_cubit.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/note_builder.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/note_container.dart';

class TrackSheet extends StatelessWidget {
  const TrackSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackCubit, TrackState>(
      builder: (context, state) {
        var notes = state.track.toList();
        return SingleChildScrollView(
          child: Text.rich(
            TextSpan(
              children: List.generate(
                notes.length,
                (index) => WidgetSpan(

                  child: NoteBuilder(
                  
                    note: notes[index],
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
