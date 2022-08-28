import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/score_editor/cubit/current_bar_key/current_bar_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/note_theme.dart';
import 'package:solpha/modules/score_editor/ui/widgets/solfa_text_field/auto_size_mixin.dart';
import 'package:solpha/modules/score_editor/ui/widgets/solfa_text_field/solfa_input_controller.dart';
import 'package:solpha/modules/score_editor/ui/widgets/solfa_text_field/solfa_text_controls.dart';

class SolfaTextField extends StatefulWidget {
  final Bar bar;
  const SolfaTextField({Key? key, required this.bar}) : super(key: key);

  SolfaEditingController get controller => bar.solfaEditingController;

  @override
  State<SolfaTextField> createState() => _SolfaTextFieldState();
}

class _SolfaTextFieldState extends State<SolfaTextField> with AutoSizeTextMixin {
  final FocusNode focus = FocusNode();

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (this.mounted) {
        this.setState(() {});
      }
    });
    focus.addListener(focusListener);
  }

  void focusListener() {
    if (focus.hasPrimaryFocus) {
      BlocProvider.of<CurrentBarCubit>(context).setKey(widget.bar);
    }
  }

  @override
  void didChangeDependencies() {
    var currentBarKey = BlocProvider.of<CurrentBarCubit>(context).state;
    if (currentBarKey?.createdAt == widget.bar.createdAt) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        Scrollable.ensureVisible(context, alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd);
      });
    }

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
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
    final textField = _buildTextField();
    // return buildAutoSizedText(context, textField, widget.controller);
    return textField;
  }

  Widget _buildTextField() {
    return BlocListener<CurrentBarCubit, Bar?>(
      listener: (context, currentBarKey) {
        if (currentBarKey?.createdAt == widget.bar.createdAt) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            FocusScope.of(context).requestFocus(focus);
          });
        } else {
          focus.unfocus();
        }
      },
      child: BlocBuilder<NoteThemeProvider, NoteTheme>(
        builder: (context, noteTheme) {
          return TextField(
            minLines: 1,
            maxLines: null,
            onTap: () {
              BlocProvider.of<ToggleKeyboardVisibilityCubit>(context).open();
              BlocProvider.of<CurrentBarCubit>(context).setKey(widget.bar);
            },
            autofocus: true,
            focusNode: focus,
            scrollPhysics: NeverScrollableScrollPhysics(),
            controller: widget.controller,
            keyboardType: TextInputType.none,
            selectionControls: SolfaTextFieldSelectionControls(
              context,
              barCubit: BlocProvider.of<CurrentBarCubit>(context),
              onCopy: (value) {
                widget.controller.copySelectedNotes();
              },
              onCut: (value) {
                widget.controller.cutSelectedNotes();
              },
              onPaste: (value) {
                widget.controller.pasteNotes();
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  setState(() {});
                });
              },
            ),
            style: noteTheme.constantStyle,
          );
        },
      ),
    );
  }
}
