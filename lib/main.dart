import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:file/file.dart' as file;
import 'package:file/memory.dart';
import 'package:flutter/material.dart';
import 'package:midi_util/midi_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    player.onDurationChanged.listen(onDurationChanged);
    player.onPositionChanged.listen(onPositionChanged);
  }

  void onPositionChanged(Duration event) {
    //  print(event.inSeconds);
  }

  void onDurationChanged(Duration event) {
    print('length=>${event.inSeconds}');
  }

  void _incrementCounter() async {
    var f = await c();

    print([
      f.readAsBytesSync(),
    ]);

    await player.setSourceBytes(f.readAsBytesSync());
    await player.resume();
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

Future<File> c() async {
  List notes = [
    60,
    62,
    64,
    65,
    67,
    69,
    71,
    72
  ];
  notes = [
    ...notes,
    ...notes
  ];
  //  # MIDI note number
  var track = 0;
  var channel = 0;
  var time = 0; //    # In beats
  var duration = 0.5; //    # In beats
  var tempo = 60; //   # In BPM
  var volume = 100; //  # 0-127, as per the MIDI standard

  MIDIFile myMIDI = MIDIFile(numTracks: 2);

  myMIDI.addTempo(
    track: track,
    time: time,
    tempo: tempo,
  );

  myMIDI.addKeySignature(
    track: track,
    time: time,
    no_of_accidentals: 0,
    accidental_mode: AccidentalMode.MAJOR,
    accidental_type: AccidentalType.SHARPS,
  );

  myMIDI.addTimeSignature(
    track: track,
    time: time,
    numerator: 2,
    denominator: 4,
    clocks_per_tick: 24,
  );

  List.generate(notes.length, (i) {
    if (i > 2) {
      myMIDI.addProgramChange(
        channel: 0,
        program: 45,
        time: time + i,
        tracknum: track,
      );
    }
    if (i > 5) {
      myMIDI.addProgramChange(
        channel: 0,
        program: 46,
        time: time + i,
        tracknum: track,
      );
    }
    myMIDI.addNote(
      track: track,
      channel: channel,
      pitch: notes[i],
      time: time + i,
      duration: duration,
      volume: volume,
    );
  });

  File outputFile = MemoryFileSystem().file('test_c_scale.mid');
  await myMIDI.writeFile(outputFile);
  return outputFile;
}
