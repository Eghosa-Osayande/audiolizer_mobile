import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audiolizer/modules/models/bar/bar.dart';
import 'package:audiolizer/modules/models/track/track.dart';
import 'package:audiolizer/modules/project_editor/cubit/focused_bar/focused_bar_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/keyboard_event/keyboard_event.dart';
import 'package:audiolizer/modules/project_editor/cubit/play_score/play_score_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/view_mode/view_mode.dart';
import 'package:audiolizer/modules/project_editor/cubit/volume_navigation/volume_navigation_cubit.dart';
import 'package:audiolizer/modules/project_editor/ui/note_widgets/note_theme.dart';
import 'package:audiolizer/modules/project_editor/ui/solfa_text_field/auto_size_mixin.dart';
import 'package:audiolizer/modules/project_editor/ui/solfa_text_field/solfa_input_controller.dart';
import 'package:audiolizer/modules/project_editor/ui/solfa_text_field/solfa_text_controls.dart';

class SolfaTextField extends StatefulWidget {
  final Bar bar;
  const SolfaTextField({Key? key, required this.bar}) : super(key: key);

  @override
  State<SolfaTextField> createState() => _SolfaTextFieldState();
}

class _SolfaTextFieldState extends State<SolfaTextField> with AutoSizeTextMixin {
  late final FocusNode focus = FocusNode(
    onKey: volumeKeyOveride,
  );

  late SolfaEditingController controller = SolfaEditingController(widget.bar.notes);

  KeyEventResult volumeKeyOveride(data, event) {
    if (BlocProvider.of<VolumeNavigationCubit>(context).state) {
      if (event.isKeyPressed(LogicalKeyboardKey.audioVolumeUp)) {
        print("Volume up");
        controller.moveCursorLeft();
        return KeyEventResult.handled;
      }
      if (event.isKeyPressed(LogicalKeyboardKey.audioVolumeDown)) {
        print("Volume down");
        controller.moveCursorRight();
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    } else {
      return KeyEventResult.ignored;
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (this.mounted) {
        this.setState(() {});
      }
    });
    focus.addListener(focusListener);
  }

  void focusListener() {
    if (focus.hasPrimaryFocus) {
      BlocProvider.of<FocusedBarCubit>(context).focusBar(widget.bar);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant SolfaTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    focus.removeListener(focusListener);
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!(widget.bar.list as Track).isVisible) {
      return SizedBox();
    }
    final textField = _buildTextField();
    // return buildAutoSizedText(context, textField, controller);
    return textField;
  }

  Widget _buildTextField() {
    return MultiBlocListener(
      listeners: [
        BlocListener<SolfaKeyBoardInputEventCubit, SolfaKeyBoardInputEvent?>(
          listener: (context, state) {
            if (state != null && (focus.hasPrimaryFocus)) {
              switch (state.name) {
                case SolfaKeyBoardInputEventName.insert:
                  controller.insertNotes(state.note);
                  break;
                case SolfaKeyBoardInputEventName.delete:
                  controller.backSpace();
                  break;
                case SolfaKeyBoardInputEventName.addBar:
                  break;
                case SolfaKeyBoardInputEventName.deleteBar:
                  if (state.barToFocus == widget.bar) {
                    BlocProvider.of<FocusedBarCubit>(context).unfocusBar();
                  }
                  break;
                case SolfaKeyBoardInputEventName.selectAll:
                  controller.selectAll();
                  break;
              }
            }
          },
        ),
        BlocListener<FocusedBarCubit, Bar?>(
          listener: (context, state) {
            if (state != widget.bar) {
              if (focus.hasPrimaryFocus) {
                focus.unfocus();
              }
            } else {
              focus.requestFocus();
              Future.delayed(
                Duration(
                  milliseconds: 500,
                ),
                () {
                  if (mounted) {
                    Scrollable.ensureVisible(context,alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd);
                  }
                },
              );
            }
          },
        ),
      ],
      child: BlocBuilder<ViewModeCubit, ViewModeState>(
        builder: (context, viewMode) {
          return BlocBuilder<NoteThemeProvider, NoteTheme>(
            builder: (context, noteTheme) {
              return TextField(
                enabled: (viewMode == ViewModeState.edit),
                minLines: 1,
                maxLines: null,
                onTap: () {
                  BlocProvider.of<ToggleSolfaKeyboardVisibilityCubit>(context).open();
                },
                autofocus: false,
                focusNode: focus,
                scrollPhysics: NeverScrollableScrollPhysics(),
                controller: controller,
                keyboardType: TextInputType.none,
                selectionControls: SolfaTextFieldSelectionControls(
                  context,
                  onCopy: (value) {
                    controller.copySelectedNotes();
                  },
                  onCut: (value) {
                    controller.cutSelectedNotes();
                  },
                  onPaste: (value) {
                    controller.pasteNotes();
                    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                      setState(() {});
                    });
                  },
                ),
                style: noteTheme.constantStyle,
                decoration: InputDecoration(
                 
                  hintText: (widget.bar.list as Track).name + '...',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
