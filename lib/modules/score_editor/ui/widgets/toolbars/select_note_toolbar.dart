import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/track/track.dart';
import 'package:solpha/modules/score_editor/cubit/current_track/current_track_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/edit_track_notes/edit_track_note_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/score/score_cubit_cubit.dart';

import 'package:flutter/material.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/score_editor/cubit/selected_notes/selected_notes_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/toggle_edit_play_mode/toggle_edit_play_mode_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';
import 'package:solpha/modules/score_editor/service/audio_player_service.dart';

class SelectNoteToolbar extends StatelessWidget implements PreferredSizeWidget {
  const SelectNoteToolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          context.read<SelectedNotesCubit>().deselectAll();
        },
      ),
      actions: [
        IconButton(
          onPressed: () {
            context.read<SelectedNotesCubit>().selectBack();
          },
          icon: Icon(Icons.arrow_back),
        ),
        // IconButton(
        //   onPressed: () {
        //     context.read<SelectedNotesCubit>().cutNotes();

        //     var copied = context.read<SelectedNotesCubit>().copiedNotesList;
        //     print('+$copied');

            
        //     context.read<SelectedNotesCubit>().deselectAll();
        //   },
        //   icon: Icon(Icons.cut),
        // ),
        IconButton(
          onPressed: () {
            var track = context.read<EditTrackNotesCubit>().track;
            context.read<SelectedNotesCubit>().copyNotes(track);
            context.read<SelectedNotesCubit>().deselectAll();
          },
          icon: Icon(Icons.copy),
        ),
        IconButton(
          onPressed: () {
            var copied = context.read<SelectedNotesCubit>().copiedNotesList;
            context.read<EditTrackNotesCubit>().pasteNotes(copied);
          },
          icon: Icon(Icons.paste),
        ),
        IconButton(
          onPressed: () {
            context.read<SelectedNotesCubit>().selectForward();
          },
          icon: Icon(Icons.arrow_forward),
        ),
      ],
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight);
  }
}
