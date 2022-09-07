import 'package:audiolizer/modules/models/bar/bar.dart';
import 'package:audiolizer/modules/models/notes/note.dart';
import 'package:audiolizer/modules/project_editor/cubit/play_score/play_score_cubit.dart';
import 'package:audiolizer/modules/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CompileErrorDialog extends StatelessWidget {
  final Widget? child;
  const CompileErrorDialog({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlayScoreCubit, PlayScoreCubitState?>(
      child: child,
      listener: (context, state) {
        if (state?.score.errorObj != null) {
          var errorTrack = state?.score.errorObj;
          showDialog(
            context: context,
            builder: (context) {
              String? errorTrackName = errorTrack?.name;
              int? errorTrackIndex = errorTrack?.errorIndex;

              Bar? errorBar = errorTrack?.errorObj;

              Note? errorNote = errorTrack?.errorObj?.errorObj;

              String start = '';
              String? mid;
              String end = '';

              for (Note note in errorBar?.notes ?? []) {
                if (note == errorNote) {
                  mid = note.displayString();
                  continue;
                }
                if (mid != null) {
                  end = end + note.displayString();
                } else {
                  start = start + note.displayString();
                }
              }
              return AlertDialog(
                title: Text('Compile error'),
                content: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Issue on track  "$errorTrackName"\n\n'),
                      WidgetSpan(
                        child: Container(
                          padding: EdgeInsets.all(4),
                          color: AppColors.instance.black,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: 'Bar ${errorTrackIndex!+1} ==> '),
                                TextSpan(text: start),
                                WidgetSpan(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: AppColors.instance.accentError,
                                    ),
                                    child: Text.rich(
                                      TextSpan(text: mid),
                                    ),
                                  ),
                                ),
                                TextSpan(text: end),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TextSpan(text: '\n\n${errorBar?.errorMessage ?? ''}'),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}

