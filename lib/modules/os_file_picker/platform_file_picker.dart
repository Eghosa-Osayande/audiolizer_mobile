import 'dart:typed_data';

import 'package:audiolizer/modules/app_services_controller/services_config.dart';
import 'package:file_picker/file_picker.dart';

class PlatformFilePickerService {
  static PlatformFilePickerService? _instance;

  PlatformFilePickerService.visibleForImpl();

  factory PlatformFilePickerService._create() {
    _instance ??= (AppServicesConfig.isTest) ? PlatformFilePickerService.visibleForImpl() : PlatformFilePickerService.visibleForImpl();
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

  Future<Uint8List?> pickFileWeb() async {
    var result = await FilePicker.platform.pickFiles(
      dialogTitle: 'Import Project',
      allowMultiple: false,
    );
    if ((result?.files.length ?? 0) > 0) {
      return result?.files.first.bytes;
    }
    return null;
  }
}
