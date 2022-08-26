import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/score_editor/cubit/current_bar_key/current_bar_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/toggle_edit_lyrics/toggle_can_edit_lyrics_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/toggle_edit_lyrics/toggle_can_see_lyrics_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';

class LyricsInput extends StatefulWidget {
  final Bar bar;
  const LyricsInput({
    Key? key,
    required this.bar,
  }) : super(key: key);

  @override
  State<LyricsInput> createState() => _LyricsInputState();
}

class _LyricsInputState extends State<LyricsInput> {
  @override
  Widget build(BuildContext context) {
    var bar = widget.bar;
    return Builder(builder: (context) {
      return BlocConsumer<CanSeeLyricsCubit, LyricsViewMode>(
        listener: (context, state) {
          switch (state) {
            case LyricsViewMode.show:
              break;
            case LyricsViewMode.hide:
              context.read<CanEditLyricsCubit>().no();
              BlocProvider.of<ToggleKeyboardVisibilityCubit>(context).showForSytemUI();
          }
        },
        builder: (context, state) {
          switch (state) {
            case LyricsViewMode.show:
              return buildShowWidget(bar);
            case LyricsViewMode.hide:
              return buildHiddenWidget();
          }
        },
      );
    });
  }

  Widget buildShowWidget(Bar bar) {
    return BlocBuilder<CanEditLyricsCubit, CanEditLyrics>(
      builder: (context, state) {
        switch (state.canEdit) {
          case CanEditLyricsEnum.yes:
            return EditLyricsWidget(
              initialValue: state.bar.lyrics,
            );

          case CanEditLyricsEnum.no:
            return InkWell(
              onLongPress: () {
                context.read<CanEditLyricsCubit>().yes();
              },
              child: Align(alignment: Alignment.centerLeft,child: Text(bar.lyrics)),
            );
        }
      },
    );
  }

  Widget buildHiddenWidget() {
    return SizedBox();
  }
}

class EditLyricsWidget extends StatefulWidget {
  final String initialValue;
  const EditLyricsWidget({
    Key? key,
    required this.initialValue,
  }) : super(key: key);

  @override
  State<EditLyricsWidget> createState() => _EditLyricsWidgetState();
}

class _EditLyricsWidgetState extends State<EditLyricsWidget> {
  final FocusNode focus = FocusNode();
  String text = '';
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ToggleKeyboardVisibilityCubit>(context).hiddenForSytemUI();
    text = widget.initialValue;
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      FocusScope.of(context).requestFocus(focus);
    });
  }

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            autofocus: false,
            focusNode: focus,
            initialValue: widget.initialValue,
            minLines: 1,
            maxLines: 4,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  focus.unfocus();
                },
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.done,
                ),
                onPressed: () {
                  BlocProvider.of<CanEditLyricsCubit>(context).addLyrics(text);
                  focus.unfocus();
                },
              ),
            ),
            textInputAction: TextInputAction.newline,
            onChanged: (value) {
              text = value;
            },
            onTap: () {
              BlocProvider.of<ToggleKeyboardVisibilityCubit>(context).hiddenForSytemUI();
            },
          ),
        ),
      ],
    );
  }
}
