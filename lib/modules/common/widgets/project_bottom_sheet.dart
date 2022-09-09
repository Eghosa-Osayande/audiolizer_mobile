import 'package:audiolizer/modules/common/widgets/confirm_action_dialog.dart';
import 'package:audiolizer/modules/pdf/ui/pdf_preview.dart';
import 'package:flutter/material.dart';
import 'package:audiolizer/modules/models/project/project_model.dart';
import 'package:audiolizer/modules/models/score/score.dart';
import 'package:audiolizer/modules/os_share_intent/services/share_intent_service.dart';
import 'package:audiolizer/modules/project_editor/ui/page/score_editor.dart';
import 'package:audiolizer/modules/project_management/manage_score_settings/ui/create_project_page.dart';
import 'package:audiolizer/modules/project_management/repo/project_repo.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class ProjectBottomSheet extends StatefulWidget {
  const ProjectBottomSheet({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  State<ProjectBottomSheet> createState() => _ProjectBottomSheetState();
}

class _ProjectBottomSheetState extends State<ProjectBottomSheet> {
  final FocusNode focus = FocusNode();

  @override
  void initState() {
    super.initState();  
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      child: SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(CreateProjectPage.route(project: widget.project));
                },
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text('Share'),
                onTap: () {
                  ShareProjectService.instance.shareProject(widget.project);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.audio_file),
                title: Text('Share as MIDI'),
                onTap: () {
                  ShareProjectService.instance.shareProjectAsMidi(widget.project);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.picture_as_pdf),
                title: Text('Share as PDF'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, ScorePdfPreview.route(project: widget.project));
                },
              ),
              ListTile(
                leading: Icon(Icons.copy),
                title: Text('Duplicate'),
                onTap: () {
                  ProjectRepo.instance.duplicate(widget.project);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Remove'),
                onTap: () {
                  Navigator.pop(context);
                  showConfirmDialog(context, 'Delete ${widget.project.title}?').then((value) {
                    if (value == true) {
                      ProjectRepo.instance.delete(widget.project);
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
