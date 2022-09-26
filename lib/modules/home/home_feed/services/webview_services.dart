import 'package:audiolizer/modules/home/home_feed/services/webview_services_stub.dart' if (dart.library.io) 'package:audiolizer/modules/home/home_feed/services/chrome_tab_webview.dart'  if (dart.library.html)   'package:audiolizer/modules/home/home_feed/services/platform_web.dart' ;


abstract class WebviewService {
  static WebviewService? _instance;

  WebviewService();

  factory WebviewService._create() {
    _instance ??= getWebviewService();

    return _instance!;
  }

  static WebviewService get instance => WebviewService._create();

  Future<void> open({required Uri url});
}

