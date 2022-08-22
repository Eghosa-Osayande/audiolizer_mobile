import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:file/memory.dart';
import 'package:flutter/material.dart';
import 'package:midi_util/midi_util.dart';
import 'package:solpha/modules/models/notes/enums/duration_markers.dart';
import 'package:solpha/modules/models/notes/enums/solfege.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/score/key_signature.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/models/score/score_settings.dart';
import 'package:solpha/modules/models/score/time_signature.dart';

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
    ScoreSettings intialSettings = ScoreSettings(
      bpm: 240,
      timeSignature: TimeSignature.t_4_4,
      keySignature: KeySignature.cmajor,
    );
    Score score = Score(intialSettings: intialSettings);

    score.createTrack(volume: 100, program: 0);
    score.createTrack(volume: 80, program: 48);

    List.generate(score.tracks.length, (index) {
      var first = score.tracks[index];

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.ti, octave: 1);
      Note.duration(first, marker: DurationMarker.full);

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.sustain, octave: 0);
      Note.duration(first, marker: DurationMarker.full);

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.sustain, octave: 0);
      Note.duration(first, marker: DurationMarker.full);

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.doh, octave: 2);
      Note.duration(first, marker: DurationMarker.full);

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.sustain, octave: 0);
      Note.duration(first, marker: DurationMarker.full);

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.sustain, octave: 0);
      Note.duration(first, marker: DurationMarker.full);

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.lah, octave: 1);
      Note.duration(first, marker: DurationMarker.full);

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.sustain, octave: 0);
      Note.duration(first, marker: DurationMarker.full);

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.sustain, octave: 0);
      Note.duration(first, marker: DurationMarker.full);

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.ti, octave: 2);
      Note.duration(first, marker: DurationMarker.full);

      List.generate(7, (index) {
        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.ti, octave: 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.doh, octave: 1);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.lah, octave: 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.ti, octave: 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.me, octave: 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.sustain, octave: 0);
        Note.duration(first, marker: DurationMarker.half);
      });
      List.generate(5, (index) {
        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.doh, octave: 1);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.ray, octave: 1);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.ti, octave: 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.doh, octave: 1);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.fah, octave: 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.sustain, octave: 0);
        Note.duration(first, marker: DurationMarker.half);
      });

      List.generate(3, (index) {
        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.ti, octave: 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.doh, octave: 1);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.lah, octave: 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.ti, octave: 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.me, octave: 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.sustain, octave: 0);
        Note.duration(first, marker: DurationMarker.half);
      });

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.ti, octave: 1);
      Note.duration(first, marker: DurationMarker.half);

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.doh, octave: 2);
      Note.duration(first, marker: DurationMarker.half);

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.ti, octave: 1);
      Note.duration(first, marker: DurationMarker.half);

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.lah, octave: 1);
      Note.duration(first, marker: DurationMarker.half);

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.soh, octave: 1);
      Note.duration(first, marker: DurationMarker.half);

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.fah, octave: 1);
      Note.duration(first, marker: DurationMarker.half);

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.me, octave: 1);
      Note.duration(first, marker: DurationMarker.half);

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.ray, octave: 1);
      Note.duration(first, marker: DurationMarker.half);

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.doh, octave: 1);
      Note.duration(first, marker: DurationMarker.half);

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.ti, octave: 0);
      Note.duration(first, marker: DurationMarker.half);

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.lah, octave: 0);
      Note.duration(first, marker: DurationMarker.half);

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.soh, octave: 0);
      Note.duration(first, marker: DurationMarker.half);

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.fah, octave: 0);
      Note.duration(first, marker: DurationMarker.half);

      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.lah, octave: 0);
      Note.duration(first, marker: DurationMarker.half);
// chorus

      List.generate(5, (index) {
        int ex = index > 1 ? 1 : 0;
        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.doh, octave: ex + -1);
        Note.duration(first, marker: DurationMarker.quarter);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.ray, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.me, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.lah, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.soh, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.lah, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.doh, octave: ex + -1);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.ray, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.me, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.fah, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.lah, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.soh, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.doh, octave: ex + -1);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.ray, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.me, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.fah, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.soh, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.lah, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.ray, octave: ex + -1);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.me, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.fah, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.soh, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.lah, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.doh, octave: ex + 1);
        Note.duration(first, marker: DurationMarker.full);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.soh, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.me, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.doh, octave: ex + 1);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.ti, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);

        Note.duration(first, marker: DurationMarker.full);
        Note.music(first, solfa: Solfege.lah, octave: ex + 0);
        Note.duration(first, marker: DurationMarker.half);
      });
      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.sustain, octave: 0);
      Note.duration(first, marker: DurationMarker.full);
      Note.duration(first, marker: DurationMarker.full);
      Note.music(first, solfa: Solfege.sustain, octave: 0);
      Note.duration(first, marker: DurationMarker.full);
    });

    score.computeTracks();

    print(score.tracks);
    for (var v in score.tracks) {
      for (var t in v) {
        t.map(
          music: (musicNote) {
            print([
              musicNote.duration,
              musicNote.position
            ]);
          },
          duration: (durationNote) {},
        );
      }
    }

    File outputFile = MemoryFileSystem().file('test_c_scale.mid');
    await score.midiFile.writeFile(outputFile);
    var f = outputFile;

    print([
      f.readAsBytesSync(),
    ]);

    await player.setSourceBytes(f.readAsBytesSync());
    await player.resume();
    // await player.seek(Duration(seconds: 14));

    // print(first);

    setState(() {
      _counter++;
    });
  }

  Future<void> tt() async {
    var f = await c();

    print([
      f.readAsBytesSync(),
    ]);

    await player.setSourceBytes(f.readAsBytesSync());
    await player.resume();
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
