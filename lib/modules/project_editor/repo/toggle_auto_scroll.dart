import 'package:audiolizer/modules/app_services_controller/services_config.dart';
import 'package:audiolizer/modules/project_editor/repo/toggle_boolean_repo_mixin.dart';

class ToggleAutoScrollRepo with ToggleBooleanRepoMixin {

 static ToggleAutoScrollRepo? _instance;

  ToggleAutoScrollRepo._();

  factory ToggleAutoScrollRepo._create() {
    _instance ??= (AppServicesConfig.isTest) ? ToggleAutoScrollRepo._() : ToggleAutoScrollRepo._();
    _instance?.listenToDatabaseChanges();
    return _instance!;
  }

  static ToggleAutoScrollRepo get instance => ToggleAutoScrollRepo._create();

  @override
  String get boxName => 'ToggleAutoScrollRepo';

  @override
  bool get defaultValue => true;
}
