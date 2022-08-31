import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/score_editor/ui/page/score_editor.dart';
import 'package:solpha/modules/scores_management/repo/scores_repo.dart';
import 'package:solpha/modules/scores_management/manage_score_settings/ui/page/manage_score_settings.dart';
import 'package:solpha/modules/scores_management/score_list/ui/widgets/score_tile.dart';

class ScorelistPage extends StatelessWidget {
  const ScorelistPage({Key? key}) : super(key: key);

  static String path = '/scores_list';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: path),
      builder: (_) => const ScorelistPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solpha'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var score = await Navigator.of(context).push(CreateScorePage.route());
          if (score != null) {
            Navigator.of(context).push(ScoreEditorPage.route(score));
          }
        },
        child: Center(
          child: Icon(Icons.add),
        ),
      ),
      body: StreamBuilder<List<Score>>(
        stream: ScoresRepo.instance.scoreListStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                var score = data[index];
                return ScoreListTile(score: score);
              },
            );
          }
          if (snapshot.hasError) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Text('Opps');
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
