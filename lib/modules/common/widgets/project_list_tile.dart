import 'package:flutter/material.dart';
import 'package:solpha/modules/common/formatters/string_formatter.dart';
import 'package:solpha/modules/common/widgets/project_bottom_sheet.dart';
import 'package:solpha/modules/models/project/project_model.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/os_share_intent/services/share_intent_service.dart';
import 'package:solpha/modules/project_editor/ui/page/score_editor.dart';
import 'package:solpha/modules/project_management/manage_score_settings/ui/create_project_page.dart';
import 'package:solpha/modules/project_management/repo/project_repo.dart';

class ProjectListTile extends StatelessWidget {
  final Project project;
  const ProjectListTile({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(ProjectEditorPage.route(project));
      },
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
          title: Text(project.title.XX,maxLines: 1,
            overflow: TextOverflow.ellipsis,),
          subtitle: Text(
            '${project.updatedAtString}',
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
