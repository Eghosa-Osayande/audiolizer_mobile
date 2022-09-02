// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solpha/modules/project_editor/ui/keyboard/button_models.dart';
import 'package:charcode/charcode.dart';

class ButtonWidget extends StatefulWidget {
  final ButtonModel data;

  final double? height;

 

  const ButtonWidget({
    Key? key,
    this.data = const ButtonModel(),
    this.height,
   
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  GlobalKey<TooltipState> tooltipKey = GlobalKey<TooltipState>();

  double initialWidth = 30;

  Timer? timer;

  Duration delay = const Duration(milliseconds: 100);

  void continuousWork() {
    widget.data.action(context);
  }

  void onJobEnd() {
    if (widget.data.canLongPress) {
      debugPrint("Job END");
      timer?.cancel();
      timer = null;
    }
  }

  void onJobStart() {
    if (widget.data.canLongPress) {
      if (timer != null) return;
      debugPrint("Job started");
      timer = Timer.periodic(delay, (timer) {
        continuousWork();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapCancel: () {
        tooltipKey.currentState?.deactivate();
        onJobEnd();
      },
      onTapDown: (details) {
        onJobStart();
        tooltipKey.currentState?.ensureTooltipVisible();
      },
      onTapUp: (details) {
        tooltipKey.currentState?.deactivate();
        continuousWork();
        onJobEnd();
      },
      child: Tooltip(
        key: tooltipKey,
        triggerMode: TooltipTriggerMode.manual,
        preferBelow: false,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white, width: 1),
        ),
        richMessage: WidgetSpan(
          child: buildBody(),
        ),
        child: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    double height = widget.height ?? 35;
    return SizedBox(
      height: height,
      width: initialWidth,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: widget.data.icon() ??
              Text(
                widget.data.displayString(),
                style: GoogleFonts.zillaSlab(fontSize: 16),
              ),
        ),
      ),
    );
  }
}
