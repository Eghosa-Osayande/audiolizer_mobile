import 'package:audiolizer/modules/app_services_controller/services_config.dart';
import 'package:audiolizer/modules/home/home_feed/services/webview_services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  @override
  void onOpened() {
    print("ChromeSafari browser opened");
  }

  @override
  void onCompletedInitialLoad() {
    print("ChromeSafari browser initial load completed");
  }

  @override
  void onClosed() {
    print("ChromeSafari browser closed");
  }
}



class CustomChromeWebviewService extends WebviewService {
  CustomChromeWebviewService();

  final ChromeSafariBrowser _browser = MyChromeSafariBrowser();

  Future<void> open({required Uri url}) async {
    return await _browser.open(url: url);
  }
}
