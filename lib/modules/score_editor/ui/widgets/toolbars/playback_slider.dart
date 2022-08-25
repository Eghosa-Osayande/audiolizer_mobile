import 'dart:async';

import 'package:flutter/material.dart';
import 'package:solpha/modules/score_editor/service/audio_player_service.dart';



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


class ToolbarPlaybackProgressHeaderDelegate extends SliverPersistentHeaderDelegate {
 
  const ToolbarPlaybackProgressHeaderDelegate();

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ToolbarPlaybackProgress();
  }

  @override
  double get maxExtent => 32;

  @override
  double get minExtent => 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
