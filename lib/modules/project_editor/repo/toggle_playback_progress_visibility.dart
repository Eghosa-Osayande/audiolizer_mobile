import 'package:audiolizer/modules/app_services_controller/services_config.dart';
import 'package:audiolizer/modules/project_editor/repo/toggle_boolean_repo_mixin.dart';

class TogglePlaybackProgressVisibilityRepo with ToggleBooleanRepoMixin {

 static TogglePlaybackProgressVisibilityRepo? _instance;

  TogglePlaybackProgressVisibilityRepo._();

  factory TogglePlaybackProgressVisibilityRepo._create() {
    _instance ??= (AppServicesConfig.isTest) ? TogglePlaybackProgressVisibilityRepo._() : TogglePlaybackProgressVisibilityRepo._();
    _instance?.listenToDatabaseChanges();
    return _instance!;
  }

  static TogglePlaybackProgressVisibilityRepo get instance => TogglePlaybackProgressVisibilityRepo._create();

  @override
  String get boxName => 'TogglePlaybackProgressVisibilityRepo';

  @override
  // TODO: implement defaultValue
  bool get defaultValue => true;
}
