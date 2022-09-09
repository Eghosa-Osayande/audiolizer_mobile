import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audiolizer/modules/project_editor/service/audio_player_service.dart';

class ToolbarPlaybackProgress extends StatefulWidget implements PreferredSizeWidget {
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

  String formatDuration(Duration d) {
    
     var seconds = d.inSeconds;
    final days = seconds~/Duration.secondsPerDay;
    seconds -= days*Duration.secondsPerDay;
    final hours = seconds~/Duration.secondsPerHour;
    seconds -= hours*Duration.secondsPerHour;
    final minutes = seconds~/Duration.secondsPerMinute;
    seconds -= minutes*Duration.secondsPerMinute;

    final List<String> tokens = [];
    if (days != 0) {
      tokens.add('${days}d');
    }
    if (tokens.isNotEmpty || hours != 0){
      tokens.add('${hours}h');
    }
    if (tokens.isNotEmpty || minutes != 0) {
      tokens.add('${minutes}m');
    }
    tokens.add('${seconds}s');

    return tokens.join(':');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SizedBox(
        height: 29,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 8),
              child: StreamBuilder<Duration>(
                  stream: AudioPlayerService.instance.onPositionChanged,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var d = snapshot.data!;
                      return Text(formatDuration(d));
                    }
                    return Text('00:00');
                  }),
            ),
            Expanded(
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
          ],
        ),
      ),
    );
  }
}
