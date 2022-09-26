import 'package:audiolizer/modules/os_file_picker/platform_file_picker.dart';
import 'package:audiolizer/modules/os_file_picker/platform_file_picker_mobile.dart';
import 'package:file/file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audiolizer/modules/app_services_controller/services_config.dart';

class PlatformFilePickerServiceWeb extends PlatformFilePickerService {
  PlatformFilePickerServiceWeb.visibleForImpl() : super.visibleForImpl();

  


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
