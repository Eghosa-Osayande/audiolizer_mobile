import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:solpha/modules/models/score/score.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@unfreezed
class Project with HiveObjectMixin, _$Project {
  Project._();

  factory Project({
    required String title,
    required String description,
    required DateTime updatedAt,
    required Score score,
    required List<Score> scoreUndoVersions,
    required List<Score> scoreRedoVersions,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

  String get updatedAtString {
    final DateFormat formatter = DateFormat.jm().add_yMd();
    return '${formatter.format(updatedAt)}';
  }

  String titleShort(int value,{String delimiter=''}) {
    return (title.length > value ? title.substring(0, value)+delimiter : title);
  }
}
