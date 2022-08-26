import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/score_editor/cubit/current_bar_key/current_bar_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/note_theme.dart';
import 'package:solpha/modules/score_editor/ui/widgets/solfa_text_field/solfa_clipboard_service.dart';
import 'package:solpha/modules/score_editor/ui/widgets/solfa_text_field/solfa_input_controller.dart';
import 'package:solpha/modules/score_editor/ui/widgets/solfa_text_field/solfa_text_controls.dart';

import 'd.dart';

class SolfaTextField extends StatefulWidget {
  final Bar bar;
  const SolfaTextField({Key? key, required this.bar}) : super(key: key);

  SolfaEditingController get controller => bar.solfaEditingController;

  @override
  State<SolfaTextField> createState() => _SolfaTextFieldState();
}

class _SolfaTextFieldState extends State<SolfaTextField> {
  final FocusNode focus = FocusNode();
  late double _textSpanWidth;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (this.mounted) {
        this.setState(() {});
      }
    });
  }

  @override
  void didChangeDependencies() {
    var currentBarKey = BlocProvider.of<CurrentBarCubit>(context).state;
    if (currentBarKey.createdAt == widget.bar.createdAt) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        Scrollable.ensureVisible(context, alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd);
      });
    }
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant SolfaTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CurrentBarCubit, Bar>(
      listener: (context, currentBarKey) {
        if (currentBarKey.createdAt == widget.bar.createdAt) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            FocusScope.of(context).requestFocus(focus);
          });
          // Future.delayed(
          //   Duration(seconds: 1),
          //   () {
          //     FocusScope.of(context).requestFocus(focus);
          //   },
          // );
        } else {
          focus.unfocus();
        }
      },
      child: LayoutBuilder(builder: (context, size) {
        var result = _calculateFontSize(
          size,
          widget.controller.buildTextSpan(
            context: context,
            withComposing: true,
          ),
          1,
        );
        print('FFF $result');
        var fontSize = result[0] as double;
        var textFits = result[1] as bool;
        Widget textField;
        NoteThemeProvider.of(context).setFontSize(fontSize);
        textField = _buildTextField();
        if (!textFits) {
          return textField;
        } else {
          return textField;
        }
      }),
    );
  }

  Widget _buildTextField() {
    return BlocBuilder<NoteThemeProvider, NoteTheme>(
      builder: (context, noteTheme) {
        return  Container(
      width:(1==2) ? double.infinity : max(noteTheme.fontSize, _textSpanWidth * MediaQuery.of(context).textScaleFactor),
          child: TextField(
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
              onCopy: (value) {
                widget.controller.copySelectedNotes();
              },
              onCut: (value) {
                widget.controller.cutSelectedNotes();
              },
              onPaste: (value) {
                widget.controller.pasteNotes();
              },
            ),
            toolbarOptions: ToolbarOptions(
              copy: true,
              paste: true,
              cut: true,
              selectAll: true,
            ),
            style: noteTheme.constantStyle,
          ),
        );
      },
    );
  }

  List _calculateFontSize(BoxConstraints size, TextSpan span, int? maxLines) {
    num minFontSize = 16;
    num maxFontSize = 20;
    TextStyle style = NoteThemeProvider.of(context).state.style;
    double stepGranularity = 0.01;

    var userScale = MediaQuery.textScaleFactorOf(context);

    int left;
    int right;

    num defaultFontSize = 20;
    //style.fontSize.clamp(minFontSize, maxFontSize);
    var defaultScale = defaultFontSize * userScale / 20;
    // style.fontSize!;
    if (_checkTextFits(span, defaultScale, maxLines, size)) {
      return [
        defaultFontSize * userScale,
        true
      ];
    }

    left = (minFontSize / stepGranularity).floor();
    right = (defaultFontSize / stepGranularity).ceil();

    var lastValueFits = false;
    while (left <= right) {
      var mid = (left + (right - left) / 2).toInt();
      double scale;
      scale = mid * userScale * stepGranularity / style.fontSize!;

      if (_checkTextFits(span, scale, maxLines, size)) {
        left = mid + 1;
        lastValueFits = true;
      } else {
        right = mid - 1;
        if (maxLines == null) left = right - 1;
      }
    }

    if (!lastValueFits) {
      right += 1;
    }

    double fontSize;
    fontSize = right * userScale * stepGranularity;

    return [
      fontSize,
      lastValueFits
    ];
  }

  bool _checkTextFits(TextSpan text, double scale, int? maxLines, BoxConstraints constraints) {
    InputDecoration decoration = InputDecoration();
    bool wrapWords = (1 == 1) ? false : true;
    TextAlign textAlign = TextAlign.start;
    double? minWidth = (1 == 1) ? 10 : null;

    double constraintWidth = constraints.maxWidth;
    double constraintHeight = constraints.maxHeight;

    if (decoration.contentPadding != null) {
      constraintWidth -= decoration.contentPadding!.horizontal;
      constraintHeight -= decoration.contentPadding!.vertical;
    }

    var tp = TextPainter(
      text: TextSpan(
        recognizer: text.recognizer,
        children: text.children,
        semanticsLabel: text.semanticsLabel,
        style: NoteThemeProvider.of(context).state.constantStyle,
      ),
      textAlign: textAlign,
      textScaleFactor: scale,
      textDirection: TextDirection.ltr,
      maxLines: maxLines,
    );

    tp.setPlaceholderDimensions(
      text.children!
          .map((e) => PlaceholderDimensions(
                size: NoteThemeProvider.of(context).size,
                alignment: PlaceholderAlignment.bottom,
              ))
          .toList(),
    );

    tp.layout(maxWidth: constraintWidth);
    double _width = (decoration.contentPadding != null) ? tp.width + decoration.contentPadding!.horizontal : tp.width;

    double _height = (decoration.contentPadding != null) ? tp.height + decoration.contentPadding!.vertical : tp.height;

    _textSpanWidth = max(_width, minWidth ?? 0);

    if (maxLines == null) {
      if (_height >= constraintHeight) {
        return false;
      } else {
        return true;
      }
    } else {
      if (_width >= constraintWidth) {
        return false;
      } else {
        return true;
      }
    }
  }
}
