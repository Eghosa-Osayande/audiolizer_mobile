import 'package:fluttertoast/fluttertoast.dart';
import 'package:solpha/modules/app_services_controller/services_config.dart';


class PlatformToastService {
  static PlatformToastService? _instance;

  PlatformToastService._();

  factory PlatformToastService._create() {
    _instance ??= (AppServicesConfig.isTest) ? PlatformToastService._() : PlatformToastService._();
    return _instance!;
  }

  static PlatformToastService get instance => PlatformToastService._create();
  showToast({required String msg}) {
    Fluttertoast.showToast(
      fontSize: 12,
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
    );
  }
}
