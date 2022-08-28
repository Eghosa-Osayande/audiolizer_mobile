import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midi_util/midi_util.dart';
import 'package:solpha/modules/models/bar/bars_linked_list.dart';
import 'package:solpha/modules/models/notes/config_notes_x.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/score/key_signature.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/models/score/time_signature.dart';
import 'package:solpha/modules/models/track/track.dart';
import 'package:solpha/modules/scores_management/repo/scores_repo.dart';

class CreateScorePage extends StatefulWidget {
  final Score? score;
  const CreateScorePage({
    Key? key,
    this.score,
  }) : super(key: key);

  static String path = '/createScore';

  static Route<Score> route() {
    return MaterialPageRoute<Score>(
      settings: RouteSettings(name: path),
      builder: (_) => const CreateScorePage(),
    );
  }

  @override
  State<CreateScorePage> createState() => _CreateScorePageState();
}

class _CreateScorePageState extends State<CreateScorePage> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    ScoreConfigNote? config = widget.score?.intialConfigNote;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.score == null ? 'New Project' : widget.score!.intialConfigNote.scoreTitle,
        ),
        actions: [
          TextButton(onPressed: onDone, child: Text('DONE'))
        ],
      ),
      body: FormBuilder(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'title',
                autofocus: true,
                initialValue: config?.scoreTitle,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                decoration: InputDecoration(
                  label: Text('Title'),
                ),
                style: GoogleFonts.inter(fontSize: 16),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              FormBuilderTextField(
                name: 'bpm',
                validator: FormBuilderValidators.compose<String>([
                  FormBuilderValidators.required(),
                  (String? value) {
                    var result = int.tryParse(value ?? '');
                    if (result == null) {
                      return 'Invalid tempo';
                    }
                  }
                ]),
                decoration: InputDecoration(
                  hintText: 'eg. 120 BPM',
                  label: Text('Tempo'),
                ),
                initialValue: config?.bpm.toString(),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
              FormBuilderDropdown<KeySignature>(
                name: 'key',
                isDense: false,
                initialValue: config?.keySignature,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                decoration: InputDecoration(
                  label: Text('Select Key Signature'),
                ),
                items: KeySignature.values.map((sign) {
                  return DropdownMenuItem<KeySignature>(
                      value: sign,
                      child: ListTile(
                        title: Text(sign.displayString),
                      ));
                }).toList(),
              ),
              FormBuilderDropdown<int>(
                name: 'pitch',
                isDense: false,
                initialValue: config?.tonicPitchNumber,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                decoration: InputDecoration(
                  hintText: 'eg. 3, doh is G3',
                  label: Text('Tonic Pitch'),
                ),
                items: List.generate(10, (index) {
                  return DropdownMenuItem<int>(
                      value: index,
                      child: ListTile(
                        title: Text('$index'),
                      ));
                }),
              ),
              FormBuilderDropdown<TimeSignature>(
                name: 'time',
                isDense: false,
                initialValue: config?.timeSignature,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                decoration: InputDecoration(
                  label: Text('Select Time Signature'),
                ),
                items: TimeSignature.values.map((sign) {
                  return DropdownMenuItem<TimeSignature>(
                      value: sign,
                      child: ListTile(
                        title: Text(sign.displayString),
                      ));
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onDone()async {
    var isValidated = formKey.currentState?.saveAndValidate();
    if (isValidated == true) {
      var value = formKey.currentState?.value;
      if (value != null) {
        if (widget.score != null) {
          widget.score!.intialConfigNote = ScoreConfigNote(
            bpm: int.parse(value['bpm']),
            timeSignature: value['time'],
            keySignature: value['key'],
            scoreTitle: value['title'],
            tonicPitchNumber: value['pitch'],
            createdAt: DateTime.now().toUtc(),
          );
          widget.score?.save();
          Navigator.pop<Score>(context, widget.score);
        } else {
          var scoreConfigNote = ScoreConfigNote(
            bpm: int.parse(value['bpm']),
            timeSignature: value['time'],
            keySignature: value['key'],
            scoreTitle: value['title'],
            tonicPitchNumber: value['pitch'],
            createdAt: DateTime.now().toUtc(),
          );
          var score = Score(
            midiFile: MIDIFile(),
            intialConfigNote: scoreConfigNote,
            tracks: [
              Track(
                trackNumber: 0,
                volume: 100,
                program: 48,
                bars: BarsLinkedlist(),
                intialScoreConfigNote: scoreConfigNote,
              )
            ],
          );
          await scoreRepo.addNewScore(score);
          Navigator.pop<Score>(context, score);
        }
      }
    }
  }
}
