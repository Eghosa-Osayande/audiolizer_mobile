import 'package:audiolizer/modules/common/formatters/date_formater.dart';
import 'package:flutter/material.dart';
import 'package:audiolizer/modules/common/formatters/string_formatter.dart';
import 'package:audiolizer/modules/common/widgets/project_bottom_sheet.dart';
import 'package:audiolizer/modules/models/project/project_model.dart';
import 'package:audiolizer/modules/models/score/score.dart';
import 'package:audiolizer/modules/os_share_intent/services/share_intent_service.dart';
import 'package:audiolizer/modules/project_editor/ui/page/score_editor.dart';
import 'package:audiolizer/modules/project_management/manage_score_settings/ui/create_project_page.dart';
import 'package:audiolizer/modules/project_management/repo/project_repo.dart';

class ProjectListTile extends StatelessWidget {
  final Project project;
  final VoidCallback? onLongPress;
  const ProjectListTile({
    Key? key,
    required this.project, this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(ProjectEditorPage.route(project));
      },
      onLongPress: onLongPress,
      child: Container(
        child: ListTile(
          leading: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(4),
            ),
            child: SizedBox.square(
              dimension: 50,
              child: Center(
                child: Text(
                  project.titleShort(3).toUpperCase(),
                ),
              ),
            ),
          ),
          title: Text(
            project.title.XX,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            'Last opened at ' + CustomDateFormater.getProjectUpdatedTime(project.updatedAt),
            style: TextStyle(fontSize: 10),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.more_vert,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ProjectBottomSheet(project: project);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
