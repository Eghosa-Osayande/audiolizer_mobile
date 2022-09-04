import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midi_util/midi_util.dart';
import 'package:audiolizer/modules/models/bar/bar.dart';
import 'package:audiolizer/modules/models/notes/config_notes_x.dart';
import 'package:audiolizer/modules/models/notes/note.dart';
import 'package:audiolizer/modules/models/project/project_model.dart';
import 'package:audiolizer/modules/models/score/enums/key_signature.dart';
import 'package:audiolizer/modules/models/score/score.dart';
import 'package:audiolizer/modules/models/score/enums/time_signature.dart';
import 'package:audiolizer/modules/models/track/enums/midi_program.dart';
import 'package:audiolizer/modules/models/track/track.dart';
import 'package:audiolizer/modules/project_management/manage_score_settings/ui/tracks_manager.dart';
import 'package:audiolizer/modules/project_management/repo/project_repo.dart';
import 'package:audiolizer/modules/themes/constants.dart';

class CreateProjectPage extends StatefulWidget {
  final Project? project;
  const CreateProjectPage({
    Key? key,
    this.project,
  }) : super(key: key);

  static String path = '/createScore';

  static Route<Project> route({Project? project}) {
    return MaterialPageRoute<Project>(
      settings: RouteSettings(name: path),
      builder: (_) => CreateProjectPage(project: project),
    );
  }

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  late Project? projectCopy = (widget.project != null) ? Project.fromJson(widget.project!.toJson()) : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.project == null ? 'New Project' : widget.project!.title,
        ),
        actions: [
          TextButton(onPressed: onDone, child: Text('SAVE'))
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
                initialValue: projectCopy?.title,
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
                initialValue: projectCopy?.score.bpm.toString(),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
              kGap14,
              FormBuilderDropdown<KeySignature>(
                name: 'key',
                isDense: false,
                initialValue: projectCopy?.score.keySignature,
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
                initialValue: projectCopy?.score.tonicPitchNumber,
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
                initialValue: projectCopy?.score.timeSignature,
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
              TracksManager(score: projectCopy?.score),
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
        if (widget.project != null) {
          updateProject(value);
        } else {
          await createProject(value);
        }
      }
    }
  }

  void updateProject(Map<String, dynamic> value) async {
    var project = widget.project!;

    var oldScore = project.score;

    project
      ..title = value['title']
      ..updatedAt = DateTime.now().toUtc();
    var updatedScore = Score(
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
      var trackCopy = Track.fromJson(track.toJson());
      trackCopy.trackNumber = trackNo;

      copiedTracks.add(
        trackCopy,
      );
      trackNo = trackNo + 1;
    }
    print(copiedTracks);
    updatedScore
      ..addAll(copiedTracks)
      ..ensureUniformTracksLength();

    project.score = updatedScore;
    project.scoreUndoVersions.add(oldScore);
    project.scoreRedoVersions.clear();

    await project.save();

    Navigator.pop<Project>(context, project);
  }

  Future<void> createProject(Map<String, dynamic> value) async {
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
      );

      copiedTracks.add(
        copied,
      );
      trackNo = trackNo + 1;
    }

    newlyCreatedScore
      ..addAll(copiedTracks)
      ..ensureUniformTracksLength();

    var newProject = Project(
      title: value['title'],
      description: '',
      updatedAt: DateTime.now(),
      score: newlyCreatedScore,
      scoreRedoVersions: [],
      scoreUndoVersions: [],
    );
    await ProjectRepo.instance.put(newProject);
    Navigator.pop<Project>(context, newProject);
  }
}
