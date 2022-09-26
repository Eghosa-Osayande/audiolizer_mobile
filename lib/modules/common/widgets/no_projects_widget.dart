import 'package:audiolizer/modules/os_file_picker/platform_file_picker.dart';
import 'package:audiolizer/modules/os_share_intent/services/share_intent_service.dart';
import 'package:audiolizer/modules/project_editor/ui/page/score_editor.dart';
import 'package:audiolizer/modules/project_management/manage_score_settings/ui/create_project_page.dart';
import 'package:file/memory.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NoProjectsWidget extends StatelessWidget {
  const NoProjectsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "You have no projects yet",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () async {
                var project = await Navigator.of(context).push(CreateProjectPage.route());
                if (project != null) {
                  Navigator.of(context).push(ProjectEditorPage.route(project));
                }
              },
              child: Text('New Project'),
            ),
            ElevatedButton(
              onPressed: () async {
  if (kIsWeb) {
      var bytes = await PlatformFilePickerService.instance.pickFileWeb();
      if (bytes != null) {
        ShareProjectService.instance.handleFile(await MemoryFileSystem().file('path').writeAsBytes(bytes));
      }
    } else {
      var path = await PlatformFilePickerService.instance.pickFile();
      if (path != null) {
        ShareProjectService.instance.processFileFromPath(path);
      }
    }


              
              },
              child: Text('Open File'),
            ),
          ],
        )
      ],
    );
  }
}
