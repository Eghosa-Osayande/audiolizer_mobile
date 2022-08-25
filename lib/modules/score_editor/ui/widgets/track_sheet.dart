import 'package:auto_size_text/auto_size_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/score_editor/cubit/edit_track_notes/edit_track_note_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/selected_notes/selected_notes_cubit.dart';
import 'package:solpha/modules/score_editor/ui/widgets/keyboard/solfa_keyboard.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/note_builder.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/music_note.dart';
import 'package:solpha/modules/score_editor/ui/widgets/side_drawer.dart';
import 'package:solpha/modules/score_editor/ui/widgets/solfa_text_field/solfa_text_feild.dart';
import 'package:solpha/modules/score_editor/ui/widgets/toolbars/media_control_toolbar.dart';
import 'package:solpha/modules/score_editor/ui/widgets/toolbars/playback_slider.dart';
import 'package:solpha/modules/score_editor/ui/widgets/toolbars/select_note_toolbar.dart';

class TrackSheet extends StatelessWidget {
  const TrackSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditTrackNotesCubit, EditTrackNotesState>(
      builder: (context, state) {
        var notes = state.track.toList();

        return BlocBuilder<SelectedNotesCubit, SelectedNotesState>(
          builder: (context, state) {
            PreferredSizeWidget appBar = ((state.enabled) ? SelectNoteToolbar() : MediaControlToolbar()) as PreferredSizeWidget;
            return Scaffold(
              drawer: SideDrawer(),
              appBar: appBar,
              body: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: CustomScrollView(
                        slivers: [
                          SliverPersistentHeader(
                            delegate: ToolbarPlaybackProgressHeaderDelegate(),
                            floating: true,
                          ),
                          SliverList(
                            delegate: SliverChildListDelegate.fixed(
                              [
                                SolfaTextField(),
                                Text.rich(
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
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height: 200,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SolfaKeyboard(),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
