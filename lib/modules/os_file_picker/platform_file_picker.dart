import 'package:file/file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:solpha/modules/app_services_controller/services_config.dart';

class PlatformFilePickerService {
  static PlatformFilePickerService? _instance;

  PlatformFilePickerService._();

  factory PlatformFilePickerService._create() {
    _instance ??= (AppServicesConfig.isTest) ? PlatformFilePickerService._() : PlatformFilePickerService._();
    return _instance!;
  }

  static PlatformFilePickerService get instance => PlatformFilePickerService._create();

  Future<String?> pickFile() async {
    var result = await FilePicker.platform.pickFiles(
      dialogTitle: 'Import Project',
      allowMultiple: false,
    );
    if ((result?.files.length ?? 0) > 0) {
      return result?.files.first.path;
    }
    return null;
  }
}
