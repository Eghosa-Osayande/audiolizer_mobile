import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/models/track/enums/midi_program.dart';
import 'package:solpha/modules/models/track/track.dart';
import 'package:solpha/modules/themes/constants.dart';

class TracksManager extends StatefulWidget {
  final Score? score;

  const TracksManager({Key? key, required this.score}) : super(key: key);

  @override
  State<TracksManager> createState() => _TracksManagerState();
}

class _TracksManagerState extends State<TracksManager> {
  late List<Track> tracks = widget.score?.tracks.toList() ?? [];
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<Track>>(
      name: 'tracks',
      initialValue: tracks,
      validator: (value) {
       
        if (tracks.isEmpty) {
          return 'Tracks can\'t be empty';
        }
        var isValidated = formKey.currentState?.saveAndValidate();

        if (!(isValidated ?? false)) {
          return '';
        }
        return null;
      },
      builder: (field) {
        return FormBuilder(
          key: formKey,
          child: Column(
            children: [
              ...List.generate(
                field.value!.length,
                (index) {
                  var track = field.value![index];

                  return TrackOptionsWidget(
                    key: ObjectKey(track),
                    track: track,
                    onDelete: () {
                      field.value!.removeAt(
                        index,
                      );
                      setState(() {});
                    },
                  );
                },
              ),
              
              Row(
                children: [
               if(tracks.length<3)   TextButton(
                    onPressed: () {
                      field.value!.add(
                        Track(
                          trackNumber: DateTime.now().millisecondsSinceEpoch,
                          volume: 127,
                          program: MidiProgram.keyboard,
                          name: 'Track',
                        ),
                      );
                      setState(() {});
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add),
                        Text('Add Track')
                      ],
                    ),
                  ),
                  SizedBox(width: 8,),
                  if(field.hasError) Text(field.errorText??''),
                ],
              ),
          
            ],
          ),
        );
      },
    );
  }
}

class TrackOptionsWidget extends StatelessWidget {
  final Track track;

  final VoidCallback onDelete;
  const TrackOptionsWidget({
    Key? key,
    required this.track,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: EdgeInsets.all(8),
          child: Stack(
            children: [
              Column(
                children: [
                  FormBuilderTextField(
                    name: '_e${track.trackNumber}',
                    initialValue: track.name,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(1)
                    ]),
                    decoration: InputDecoration(
                      hintText: '',
                      label: Text('Track name'),
                    ),
                    onChanged: (value) {
                      track.name = value ?? '';
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderDropdown<MidiProgram>(
                          name: '_exclude${track.trackNumber}',
                          isDense: false,
                          initialValue: track.program,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          decoration: InputDecoration(
                            label: Text('Instrument'),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              track.program = value;
                            }
                          },
                          items: MidiProgram.values.map((sign) {
                            return DropdownMenuItem<MidiProgram>(
                                value: sign,
                                child: ListTile(
                                  title: Text(sign.name),
                                ));
                          }).toList(),
                        ),
                      ),
                      Expanded(
                        child: FormBuilderDropdown<int>(
                          name: '_exclude2${track.trackNumber}',
                          isDense: false,
                          initialValue: track.volume,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          decoration: InputDecoration(
                            label: Text('Volume'),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              track.trackNumber = value;
                            }
                          },
                          items: List.generate(128, (index) {
                            return DropdownMenuItem<int>(
                                value: index,
                                child: ListTile(
                                  title: Text('$index'),
                                ));
                          }),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: PopupMenuButton(
                  child: Icon(Icons.more_vert),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: Text('Remove'),
                        onTap: onDelete,
                      ),
                    ];
                  },
                ),
              ),
            ],
          ),
        ),
        kGap14,
      ],
    );
  }
}
