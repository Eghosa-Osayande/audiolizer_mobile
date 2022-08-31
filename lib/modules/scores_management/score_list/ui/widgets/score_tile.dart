import 'package:flutter/material.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/score_editor/ui/page/score_editor.dart';

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
          leading: Text('D'),
          title: Text(score.scoreTitle),
          subtitle: Text('${score.updatedAt}'),
        ),
      ),
    );
  }
}
