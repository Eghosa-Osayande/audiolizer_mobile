import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/score_editor/cubit/current_bar_key/current_bar_cubit.dart';
import 'package:solpha/modules/score_editor/cubit/toggle_edit_lyrics/toggle_can_edit_lyrics_cubit.dart';

class SolfaTextFieldSelectionControls extends MaterialTextSelectionControls {
  SolfaTextFieldSelectionControls(
    this.cubitContext, {
    this.onPaste,
    this.onCopy,
    this.onCut,
    this.onAddLyrics,
    required this.barCubit,
  });

  ValueChanged<TextSelectionDelegate>? onPaste;
  ValueChanged<TextSelectionDelegate>? onCopy;
  ValueChanged<TextSelectionDelegate>? onCut;
  ValueChanged<TextSelectionDelegate>? onAddLyrics;
  final CurrentBarCubit barCubit;
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
    return BlocProvider.value(
      value: barCubit,
      child: Builder(builder: (context) {
        return CupertinoTextSelectionToolbar(
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
            BlocBuilder<CurrentBarCubit, Bar?>(
              builder: (context, bar) {
                
                  return ControlButton(
                    onTap: () {
                      cubitContext.read<CanEditLyricsCubit>().yes();
                      delegate.hideToolbar();
                    },
                    child: Text('Edit Lyrics'),
                  );
                
              },
            ),
          ],
        );
      }),
    );
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
