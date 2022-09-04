import 'package:audiolizer/modules/common/widgets/confirm_action_dialog.dart';
import 'package:audiolizer/modules/common/widgets/toolbar_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:audiolizer/modules/models/score/score.dart';
import 'package:audiolizer/modules/models/track/enums/midi_program.dart';
import 'package:audiolizer/modules/models/track/track.dart';
import 'package:audiolizer/modules/themes/constants.dart';

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
                      
                      showConfirmDialog(context, 'Delete Track "${track.name}" ?').then(
                        (value) {
                          if (value == true) {
                            field.value!.removeAt(
                              index,
                            );
                            setState(() {});
                          }
                        },
                      );
                    },
                  );
                },
              ),
              Row(
                children: [
                  if (tracks.length < 3)
                    TextButton(
                      onPressed: () {
                        field.value!.add(
                          Track(
                            trackNumber: DateTime.now().millisecondsSinceEpoch,
                            volume: 100,
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
                  SizedBox(
                    width: 8,
                  ),
                  if (field.hasError) Text(field.errorText ?? ''),
                ],
              ),
              SizedBox(
                height: 90,
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
    return FormBuilderField<bool>(
        name: '_vv${track.trackNumber}',
        initialValue: track.isLyricsVisible,
        onChanged: (value) {
          track.isLyricsVisible = value!;
        },
        builder: (lyricsVisibilityField) {
          return FormBuilderField<bool>(
              name: '_v${track.trackNumber}',
              initialValue: track.isVisible,
              onChanged: (value) {
                track.isVisible = value!;
              },
              builder: (visibilityField) {
                return Column(
                  children: [
                    kGap14,
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Stack(
                        children: [
                          Opacity(
                            opacity: (visibilityField.value!) ? 1 : 0.4,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: FormBuilderTextField(
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
                                    ),
                                  ],
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
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: FormBuilderSlider(
                                        name: '_exclude2${track.trackNumber}',
                                        initialValue: track.volume.toDouble(),
                                        max: 100,
                                        min: 0,
                                        divisions: 100,
                                        validator: FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                        ]),
                                        decoration: InputDecoration(
                                          label: Text('Volume'),
                                          border: InputBorder.none,
                                        ),
                                        onChanged: (value) {
                                          if (value != null) {
                                            track.volume = value.toInt();
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            width: 50,
                            height: 50,
                            child: PopupMenuButton(
                              child: Icon(Icons.more_vert),
                              onSelected: (value) {
                                switch (value) {
                                  case 'remove':
                                    onDelete.call();
                                    break;
                                }
                              },
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                    child: ToolbarOption(
                                      title: (visibilityField.value!) ? 'Hide Track' : 'Show Track',
                                      trailing: Icon(
                                        (visibilityField.value!) ? Icons.visibility : Icons.visibility_off,
                                      ),
                                    ),
                                    onTap: () {
                                      visibilityField.didChange(!visibilityField.value!);
                                    },
                                  ),
                                  PopupMenuItem(
                                    child: ToolbarOption(
                                      title: (lyricsVisibilityField.value!) ? 'Hide Lyrics' : 'Show Lyrics',
                                      trailing: Icon(
                                        (lyricsVisibilityField.value!) ? Icons.visibility : Icons.visibility_off,
                                      ),
                                    ),
                                    onTap: () {
                                      lyricsVisibilityField.didChange(!lyricsVisibilityField.value!);
                                    },
                                  ),
                                  PopupMenuItem(
                                    child: Text('Remove'),
                                    value: 'remove',
                                  ),
                                ];
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              });
        });
  }
}
