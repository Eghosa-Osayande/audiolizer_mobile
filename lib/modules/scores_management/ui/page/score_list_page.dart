import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:solpha/modules/models/score/score.dart';
import 'package:solpha/modules/scores_management/ui/page/manage_score_settings.dart';

class ScorelistPage extends StatelessWidget {
  const ScorelistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solpha'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          
          var score = await Navigator.of(context).push(CreateScorePage.route());
        
        },
        child: Center(
          child: Icon(Icons.add),
        ),
      ),
      body: Center(),
    );
  }
}
