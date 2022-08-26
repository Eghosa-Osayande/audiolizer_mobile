import 'dart:async';

import 'package:flutter/material.dart';
import 'package:solpha/modules/score_editor/service/audio_player_service.dart';



class ToolbarPlaybackProgress extends StatefulWidget implements PreferredSizeWidget  {
  ToolbarPlaybackProgress({
    Key? key,
  }) : super(key: key);

  @override
  State<ToolbarPlaybackProgress> createState() => _ToolbarPlaybackProgressState();
  
  @override
  Size get preferredSize => Size.fromHeight(30);
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
    return Container(
      
      color: Colors.black,
      
      child: SizedBox(
        height: 29,
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
    );
  }
}


