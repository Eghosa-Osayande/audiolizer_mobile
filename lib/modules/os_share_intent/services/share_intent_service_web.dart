import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:audiolizer/modules/firebase/firebase_service.dart';
import 'package:audiolizer/modules/models/project/project_model.dart';
import 'package:audiolizer/modules/os_path/services/path/platform_path_service.dart';
import 'package:audiolizer/modules/os_share_intent/services/share_intent_service.dart';
import 'package:audiolizer/modules/os_toast/services/platform_toast_service.dart';
import 'package:file/memory.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import 'dart:html' as html;

void _downloadFile(File file, String FileName) {
  final rawData = file.readAsBytesSync();
  final content = base64Encode(rawData);
  final anchor = html.AnchorElement(href: "data:application/octet-stream;charset=utf-16le;base64,$content")
    ..setAttribute("download", FileName)
    ..click();
}

class ShareProjectServiceImpl extends ShareProjectService {
  ShareProjectServiceImpl.visibleForImpl() : super.visibleForImpl();

  _startListeningForIncomingShareIntent() {}

  Future handleAnyInitialSharedProject() async {}

  void _onShareIntentRecieved(List<SharedMediaFile> value) async {}

  Future<void> processFileFromPath(String filePath) async {}

  Future<void> handleFile(File file) async {
    super.handleFile(file);
  }

  Future<void> shareProject(Project project) async {
    FirebaseService.instance.logEvent(name: 'share_project');
    String shareData = json.encode(project.toJson());

    File outputFile = MemoryFileSystem().file('${project.title}.solfa');
    // await outputFile.create(recursive: true);
    var result = await outputFile.writeAsString(shareData);
    _downloadFile(result, '${project.title}.solfa');
  }

  Future<void> shareProjects(List<Project> projects) async {
    List<String> paths = [];
    for (var project in projects) {
      FirebaseService.instance.logEvent(name: 'share_project');
      String shareData = json.encode(project.toJson());

      File outputFile = MemoryFileSystem().file('${project.title}.solfa');
      var result = await outputFile.writeAsString(shareData);
      _downloadFile(result, '${project.title}.solfa');
    }
  }

  Future<void> shareProjectAsMidi(Project project) async {
    var result = await project.score.commit();
    if (result?.isSuccess ?? false) {
      FirebaseService.instance.logEvent(name: 'share_midi');
      _downloadFile(result!.success, '${project.title}_audiolizer.mid');
    } else {
      PlatformToastService.instance.showToast(
        msg: 'Failed to create MIDI file because errors exist in this project',
      );
    }
  }
}
