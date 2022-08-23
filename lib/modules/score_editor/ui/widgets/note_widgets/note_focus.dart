import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/score_editor/cubit/track/track_cubit.dart';

class NoteFocus extends StatelessWidget {
  final Note note;
  final Widget Function(BuildContext context, bool isFocused)? builder;

  const NoteFocus({
    Key? key,
    required this.note,
    this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackCubit, TrackState>(
      builder: (context, state) {
        bool isFocused = state.currentNote == note;
        return InkWell(
          onTap: () {
            context.read<TrackCubit>().setCurrentNote(note);
          },
          child: builder?.call(context, isFocused),
        );
      },
    );
  }
}
