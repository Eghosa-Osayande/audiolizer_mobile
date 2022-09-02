import 'package:flutter/material.dart';
import 'package:solpha/modules/models/project/project_model.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/os_share_intent/services/share_intent_service.dart';
import 'package:solpha/modules/project_editor/ui/page/score_editor.dart';
import 'package:solpha/modules/project_management/manage_score_settings/ui/create_project_page.dart';
import 'package:solpha/modules/project_management/repo/project_repo.dart';

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
                ShareIntentService.instance.shareProject(project);
                Navigator.pop(context);
              },
            ),
         
           
            ListTile(
             leading: Icon(Icons.share),
              title: Text('Share as Midi'),
              onTap: () {
                //  ShareIntentService.instance.shareProject(project);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share as PDF'),
              onTap: () {
                //  ShareIntentService.instance.shareProject(project);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('View PDF'),
              onTap: () {
                //  ShareIntentService.instance.shareProject(project);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.copy),
              title: Text('Duplicate'),
              onTap: () {
                //  ShareIntentService.instance.shareProject(project);
                Navigator.pop(context);
              },
            ),
             ListTile(
              leading: Icon(Icons.delete),
              title: Text('Remove'),
              onTap: () {
                ProjectRepo.instance.delete(project);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
