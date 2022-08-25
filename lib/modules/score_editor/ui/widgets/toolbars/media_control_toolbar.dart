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

class MediaControlToolbar extends StatelessWidget implements PreferredSizeWidget {
  const MediaControlToolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentTrackCubit, int>(
      builder: (context, currentIndex) {
        return BlocBuilder<ScoreCubit, ScoreCubitState>(
          builder: (context, state) {
            var tracks = state.score.tracks;
            var noOfTracks = tracks.length;
            return AppBar(
              title: Text('Track ${currentIndex + 1}'),
              actions: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<ScoreCubit>(context).play();
                  },
                  icon: BlocBuilder<ToggleEditPlayModeCubit, ToggleEditPlayModeState>(
                    builder: (context, state) {
                      print(state);
                      switch (state) {
                        case ToggleEditPlayModeState.edit:
                          return Icon(Icons.play_arrow);

                        case ToggleEditPlayModeState.playing:
                          return Icon(Icons.pause);
                      }
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<ToggleKeyboardVisibilityCubit>(context).toggle();
                  },
                  icon: BlocBuilder<ToggleKeyboardVisibilityCubit, KeyboardVisibility>(
                    builder: (context, state) {
                      switch (state) {
                        case KeyboardVisibility.visible:
                          return Icon(Icons.keyboard);

                        case KeyboardVisibility.hidden:
                          return Icon(Icons.keyboard_alt_outlined);
                      }
                    },
                  ),
                ),
                PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: ListTile(
                          title: Text('Undo'),
                          onTap: () {
                            BlocProvider.of<EditTrackNotesCubit>(context).undo();
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      PopupMenuItem(
                        child: ListTile(
                          title: Text('Redo'),
                          onTap: () {
                            BlocProvider.of<EditTrackNotesCubit>(context).redo();
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      PopupMenuItem(
                        child: ListTile(
                          title: Text('Select'),
                          onTap: () {
                            var note = context.read<EditTrackNotesCubit>().getCurrentNote();
                            if (note != null) {
                              context.read<SelectedNotesCubit>().toggleSelection(note);
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                      ),
                      PopupMenuItem(
                        child: ListTile(
                          title: Text('Paste'),
                          onTap: () {
                             var copied = context.read<SelectedNotesCubit>().copiedNotesList;
            context.read<EditTrackNotesCubit>().pasteNotes(copied);
                          },
                        ),
                      ),
                    ];
                  },
                  icon: Icon(
                    Icons.more_vert,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight);
  }
}

class ToolbarPlaybackProgress extends StatefulWidget {
  ToolbarPlaybackProgress({
    Key? key,
  }) : super(key: key);

  @override
  State<ToolbarPlaybackProgress> createState() => _ToolbarPlaybackProgressState();
}

class _ToolbarPlaybackProgressState extends State<ToolbarPlaybackProgress> {
  double max = 0;

  double value = 0;

  StreamSubscription<Duration>? sub2;

  StreamSubscription<Duration>? sub1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sub1 = AudioPlayerService.instance.onPositionChanged.listen(onPositionChanged);
    sub2 = AudioPlayerService.instance.onDurationChanged.listen(onDurationChanged);
  }

  void onDurationChanged(Duration _duration) {
    max = _duration.inSeconds.toDouble();
    if (value > max) {
      max = value;
    }
    setState(() {});
  }

  void onPositionChanged(Duration _position) {
    var _p = _position.inSeconds.toDouble();
    if (_p > max) {
      max = _p;
    }
    setState(() {
      value = _p;
      max = max;
    });
  }

  @override
  void dispose() {
    sub1?.cancel();
    sub2?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(left: 50),
          // color: Colors.teal,
          height: 20,
          child: Center(
            child: Slider(
              value: value,
              onChangeStart: (_value) {
                AudioPlayerService.instance.seek(Duration(seconds: value.toInt()));
                setState(() {
                  value = _value;
                });
              },
              onChangeEnd: (_value) {
                AudioPlayerService.instance.seek(Duration(seconds: value.toInt()));
                setState(() {
                  value = _value;
                });
              },
              onChanged: (_value) {
                AudioPlayerService.instance.seek(Duration(seconds: value.toInt()));
                setState(() {
                  value = _value;
                });
              },
              max: max,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class CustomBoxHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  const CustomBoxHeaderDelegate({
    required this.child,
    required this.maxHeight,
    required this.minHeight,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
