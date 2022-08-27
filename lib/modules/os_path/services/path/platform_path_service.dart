
import 'package:path_provider/path_provider.dart';
import 'package:solpha/modules/app_services_controller/services_config.dart';

class PlatformPathService {
  static PlatformPathService? _instance;

  PlatformPathService._();

  factory PlatformPathService._create() {
    _instance ??= (AppServicesConfig.isTest) ? PlatformPathService._() : PlatformPathService._();
    return _instance!;
  }

 static PlatformPathService get instance => PlatformPathService._create();

  Future<String> getHiveDirectory() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = directory.path;
    return path;
  }
}
