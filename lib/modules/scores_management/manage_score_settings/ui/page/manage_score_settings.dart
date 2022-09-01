import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midi_util/midi_util.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/models/bar/bars_linked_list.dart';
import 'package:solpha/modules/models/notes/config_notes_x.dart';
import 'package:solpha/modules/models/notes/note.dart';
import 'package:solpha/modules/models/score/enums/key_signature.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/models/score/enums/time_signature.dart';
import 'package:solpha/modules/models/track/enums/midi_program.dart';
import 'package:solpha/modules/models/track/track.dart';
import 'package:solpha/modules/scores_management/manage_score_settings/ui/widgets/tracks_manager.dart';
import 'package:solpha/modules/scores_management/repo/scores_repo.dart';
import 'package:solpha/modules/themes/constants.dart';

class CreateScorePage extends StatefulWidget {
  final Score? score;
  const CreateScorePage({
    Key? key,
    this.score,
  }) : super(key: key);

  static String path = '/createScore';

  static Route<Score> route({Score? score}) {
    return MaterialPageRoute<Score>(
      settings: RouteSettings(name: path),
      builder: (_) => CreateScorePage(score: score),
    );
  }

  @override
  State<CreateScorePage> createState() => _CreateScorePageState();
}

class _CreateScorePageState extends State<CreateScorePage> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var score = widget.score;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.score == null ? 'New Project' : widget.score!.scoreTitle,
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
              kGap14,
              FormBuilderTextField(
                name: 'title',
                initialValue: score?.scoreTitle,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                decoration: InputDecoration(label: Text('Title'), contentPadding: kNewProjectContentPadding, border: kNewProjectInputBorder),
                style: GoogleFonts.inter(fontSize: 16),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              kGap14,
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
                decoration: InputDecoration(hintText: 'eg. 120 BPM', label: Text('Tempo'), contentPadding: kNewProjectContentPadding, border: kNewProjectInputBorder),
                initialValue: score?.bpm.toString(),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
              kGap14,
              FormBuilderDropdown<KeySignature>(
                name: 'key',
                isDense: false,
                initialValue: score?.keySignature,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                decoration: InputDecoration(label: Text('Select Key Signature'), contentPadding: kNewProjectContentPadding, border: kNewProjectInputBorder),
                items: KeySignature.values.map((sign) {
                  return DropdownMenuItem<KeySignature>(
                      value: sign,
                      child: ListTile(
                        title: Text(sign.displayString),
                      ));
                }).toList(),
              ),
              kGap14,
              FormBuilderDropdown<int>(
                name: 'pitch',
                isDense: false,
                initialValue: score?.tonicPitchNumber,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                decoration: InputDecoration(hintText: 'eg. 3, doh is G3', label: Text('Tonic Pitch'), contentPadding: kNewProjectContentPadding, border: kNewProjectInputBorder),
                items: List.generate(10, (index) {
                  return DropdownMenuItem<int>(
                      value: index,
                      child: ListTile(
                        title: Text('$index'),
                      ));
                }),
              ),
              kGap14,
              FormBuilderDropdown<TimeSignature>(
                name: 'time',
                isDense: false,
                initialValue: score?.timeSignature,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                decoration: InputDecoration(label: Text('Select Time Signature'), contentPadding: kNewProjectContentPadding, border: kNewProjectInputBorder),
                items: TimeSignature.values.map((sign) {
                  return DropdownMenuItem<TimeSignature>(
                      value: sign,
                      child: ListTile(
                        title: Text(sign.displayString),
                      ));
                }).toList(),
              ),
              kGap14,
              TracksManager(score: score),
            ],
          ),
        ),
      ),
    );
  }

  void onDone() async {
    var isValidated = formKey.currentState?.saveAndValidate();
    print('is validated $isValidated');
    if (isValidated == true) {
      var value = formKey.currentState?.value;
      if (value != null) {
        if (widget.score != null) {
          // updating score
          widget.score!
            ..bpm = int.parse(value['bpm'])
            ..timeSignature = value['time']
            ..keySignature = value['key']
            ..scoreTitle = value['title']
            ..tonicPitchNumber = value['pitch']
            ..updatedAt = DateTime.now().toUtc();
          var tracks = (formKey.currentState?.value['tracks'] as List<Track>);

          int trackNo = 0;
          List<Track> copiedTracks = [];
          for (var track in tracks) {
            var copied = track.copyWith(
              trackNumber: trackNo,
            );
            for (var bar in track) {
              copied.add(bar.copyWith());
            }
            copiedTracks.add(
              copied,
            );
            trackNo = trackNo + 1;
          }
          print(copiedTracks);
          // widget.score!.clear();
          // widget.score!.addAll(copiedTracks);
          // await widget.score?.save();

          // Navigator.pop<Score>(context, widget.score);
        } else {
          // creating score

          var newlyCreatedScore = Score(
            bpm: int.parse(value['bpm']),
            timeSignature: value['time'],
            keySignature: value['key'],
            scoreTitle: value['title'],
            tonicPitchNumber: value['pitch'],
            updatedAt: DateTime.now().toUtc(),
          );
          var tracks = (formKey.currentState?.value['tracks'] as List<Track>);

          int trackNo = 0;
          List<Track> copiedTracks = [];
          for (var track in tracks) {
            var copied = track.copyWith(
              trackNumber: trackNo,
            )..add(
                Bar(
                  createdAt: DateTime.now().toUtc(),
                  notes: [],
                ),
              );

            copiedTracks.add(
              copied,
            );
            trackNo = trackNo + 1;
          }

          newlyCreatedScore.addAll(copiedTracks);
          // print(newlyCreatedScore.length);
          await ScoresRepo.instance.put(newlyCreatedScore);
          Navigator.pop<Score>(context, newlyCreatedScore);
        }
      }
    }
  }
}
