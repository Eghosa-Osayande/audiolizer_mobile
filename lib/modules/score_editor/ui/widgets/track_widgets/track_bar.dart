import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solpha/modules/models/bar/bar.dart';
import 'package:solpha/modules/score_editor/ui/widgets/note_widgets/note_theme.dart';
import 'package:solpha/modules/score_editor/ui/widgets/solfa_text_field/solfa_text_field.dart';

class TrackBarWidget extends StatelessWidget {
  final int index;
  final Bar bar;

  const TrackBarWidget({
    Key? key,
    required this.bar,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NoteThemeProvider(),
        ),
      ],
      child: SolfaTextField(
        key: ObjectKey(bar),
        bar: bar,
      ),
    );
  }
}
