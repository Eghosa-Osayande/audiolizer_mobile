import 'package:flutter/material.dart';
import 'package:solpha/modules/score_editor/ui/page/score_editor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness:Brightness.dark, 
      ),
      home: const ScoreEditorPage(),
    );
  }
}
