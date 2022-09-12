import 'package:audiolizer/modules/project_editor/cubit/edit_lyrics/edit_lyrics_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/toggle_keyboard_visibility.dart/toggle_keyboard_visibility_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/undo_redo/undo_redo_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audiolizer/modules/models/bar/bar.dart';

import 'package:audiolizer/modules/project_editor/cubit/focused_bar/focused_bar_cubit.dart';
import 'package:audiolizer/modules/project_editor/cubit/keyboard_event/keyboard_event.dart';

class SolfaTextFieldSelectionControls extends MaterialTextSelectionControls {
  SolfaTextFieldSelectionControls(
    this.cubitContext, {
    this.onPaste,
    this.onCopy,
    this.onCut,
    this.onAddLyrics,
  });

  ValueChanged<TextSelectionDelegate>? onPaste;
  ValueChanged<TextSelectionDelegate>? onCopy;
  ValueChanged<TextSelectionDelegate>? onCut;
  ValueChanged<TextSelectionDelegate>? onAddLyrics;

  final BuildContext cubitContext;

  @override
  Future<void> handlePaste(final TextSelectionDelegate delegate) async {
    onPaste?.call(delegate);
    // delegate.hideToolbar();
    return super.handlePaste(delegate);
  }

  @override
  Widget buildToolbar(
    BuildContext context,
    Rect globalEditableRegion,
    double textLineHeight,
    Offset selectionMidpoint,
    List<TextSelectionPoint> endpoints,
    TextSelectionDelegate delegate,
    ClipboardStatusNotifier? clipboardStatus,
    Offset? lastSecondaryTapDownPosition,
  ) {
    const double _kHandleSize = 22.0;

    // Padding between the toolbar and the anchor.
    const double _kToolbarContentDistanceBelow = _kHandleSize - 2.0;
    const double _kToolbarContentDistance = 8.0;
    final TextSelectionPoint startTextSelectionPoint = endpoints[0];
    final TextSelectionPoint endTextSelectionPoint = endpoints.length > 1 ? endpoints[1] : endpoints[0];
    final Offset anchorAbove = Offset(
      globalEditableRegion.left + selectionMidpoint.dx,
      globalEditableRegion.top + startTextSelectionPoint.point.dy - textLineHeight - _kToolbarContentDistance,
    );
    final Offset anchorBelow = Offset(
      globalEditableRegion.left + selectionMidpoint.dx,
      globalEditableRegion.top + endTextSelectionPoint.point.dy + _kToolbarContentDistanceBelow,
    );
    return Builder(builder: (context) {
      return TextSelectionToolbar(
        anchorAbove: anchorAbove,
        anchorBelow: anchorBelow,
        children: [
          ControlButton(
            onTap: () {
              onCut?.call(delegate);
              delegate.hideToolbar();
            },
            child: Text('Cut'),
          ),
          ControlButton(
            onTap: () {
              onCopy?.call(delegate);
              delegate.hideToolbar();
            },
            child: Text('Copy'),
          ),
          ControlButton(
            onTap: () {
              onPaste?.call(delegate);
              delegate.hideToolbar();
            },
            child: Text('Paste'),
          ),
          ControlButton(
            onTap: () {
              BlocProvider.of<SolfaKeyBoardInputEventCubit>(cubitContext).selectAll();
              // delegate.hideToolbar();
            },
            child: Text('SelectAll'),
          ),
          ControlButton(
            onTap: () {
              var bar = BlocProvider.of<FocusedBarCubit>(cubitContext).state;
              if (bar != null) {
                BlocProvider.of<UndoRedoCubit>(cubitContext).takeSnapShot();
                BlocProvider.of<SolfaKeyBoardInputEventCubit>(cubitContext).deleteBars([
                  bar
                ]);
              }

              delegate.hideToolbar();
            },
            child: Text('Delete Bars'),
          ),
          ControlButton(
            onTap: () {
              var bar = BlocProvider.of<FocusedBarCubit>(cubitContext).state;
              if (bar != null) {
                BlocProvider.of<UndoRedoCubit>(cubitContext).takeSnapShot();
                BlocProvider.of<SolfaKeyBoardInputEventCubit>(cubitContext).duplicateBars([
                  bar
                ]);
              }

              delegate.hideToolbar();
            },
            child: Text('Duplicate Bars'),
          ),
          ControlButton(
            onTap: () {
              var bar = BlocProvider.of<FocusedBarCubit>(cubitContext).state;
              if (bar != null) {
                BlocProvider.of<UndoRedoCubit>(cubitContext).takeSnapShot();
                BlocProvider.of<SolfaKeyBoardInputEventCubit>(cubitContext).shiftOctaveDown();
              }

              // delegate.hideToolbar();
            },
            child: Text('Octave -'),
          ),
          ControlButton(
            onTap: () {
              var bar = BlocProvider.of<FocusedBarCubit>(cubitContext).state;
              if (bar != null) {
                BlocProvider.of<UndoRedoCubit>(cubitContext).takeSnapShot();
                BlocProvider.of<SolfaKeyBoardInputEventCubit>(cubitContext).shiftOctaveUp();
              }

              // delegate.hideToolbar();
            },
            child: Text('Octave +'),
          ),
          ControlButton(
            onTap: () {
              var bar = BlocProvider.of<FocusedBarCubit>(cubitContext).state;
              if (bar != null) {
                BlocProvider.of<UndoRedoCubit>(cubitContext).takeSnapShot();
                BlocProvider.of<SolfaKeyBoardInputEventCubit>(cubitContext).muteNotes();
              }

              delegate.hideToolbar();
            },
            child: Text('Mute Selected Notes'),
          ),
        ],
      );
    });
  }
}

class ControlButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  const ControlButton({
    Key? key,
    this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: TextButton(
        style: ButtonStyle(foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.white)),
        onPressed: onTap,
        child: child,
      ),
    );
  }
}
