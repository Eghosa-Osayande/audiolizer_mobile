import 'package:flutter/material.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/os_share_intent/services/share_intent_service.dart';
import 'package:solpha/modules/score_editor/ui/page/score_editor.dart';
import 'package:solpha/modules/scores_management/manage_score_settings/ui/page/manage_score_settings.dart';
import 'package:solpha/modules/scores_management/repo/scores_repo.dart';

class ScoreListTile extends StatelessWidget {
  final Score score;
  const ScoreListTile({
    Key? key,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(ScoreEditorPage.route(score));
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
                  score.scoreTitle[0].toUpperCase(),
                ),
              ),
            ),
          ),
          title: Text(score.scoreTitle),
          subtitle: Text('${score.updatedAtString}'),
          trailing: PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
            ),
            onSelected: (value) {
              if(value==0){
                Navigator.of(context).push(CreateScorePage.route(score: score));
              }
            },
            itemBuilder: (_) {
              return [
                PopupMenuItem(
                  child: Text('Share'),
                  onTap: () {
                    ShareIntentService.instance.shareScore(score);
                  },
                ),
                PopupMenuItem(
                  child: Text('Settings'),
                  value: 0,
                ),
                PopupMenuItem(
                  child: Text('Remove'),
                  onTap: ()async {
                    await ScoresRepo.instance.delete(score);
                  },
                ),
              ];
            },
          ),
        ),
      ),
    );
  }
}
