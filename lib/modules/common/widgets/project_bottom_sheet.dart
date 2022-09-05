import 'package:audiolizer/modules/common/widgets/confirm_action_dialog.dart';
import 'package:audiolizer/modules/pdf/ui/pdf_preview.dart';
import 'package:flutter/material.dart';
import 'package:audiolizer/modules/models/project/project_model.dart';
import 'package:audiolizer/modules/models/score/score.dart';
import 'package:audiolizer/modules/os_share_intent/services/share_intent_service.dart';
import 'package:audiolizer/modules/project_editor/ui/page/score_editor.dart';
import 'package:audiolizer/modules/project_management/manage_score_settings/ui/create_project_page.dart';
import 'package:audiolizer/modules/project_management/repo/project_repo.dart';

class ProjectBottomSheet extends StatelessWidget {
  const ProjectBottomSheet({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(CreateProjectPage.route(project: project));
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share'),
              onTap: () {
                ShareProjectService.instance.shareProject(project);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.audio_file),
              title: Text('Share as MIDI'),
              onTap: () {
                //  ShareIntentService.instance.shareProject(project);
                Navigator.pop(context);
              },
            ),
           
            ListTile(
              leading: Icon(Icons.picture_as_pdf),
              title: Text('Share as PDF'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, ScorePdfPreview.route(project: project));
              },
            ),
            ListTile(
              leading: Icon(Icons.copy),
              title: Text('Duplicate'),
              onTap: () {
                ProjectRepo.instance.duplicate(project);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Remove'),
              onTap: () {
                Navigator.pop(context);
                showConfirmDialog(context, 'Delete ${project.title}?').then((value) {
                  if (value == true) {
                    ProjectRepo.instance.delete(project);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
