import 'package:audiolizer/modules/app_services_controller/services_config.dart';
import 'package:audiolizer/modules/home/home_feed/services/chrome_tab_webview.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';



abstract class WebviewService {
  static WebviewService? _instance;

  WebviewService();

  factory WebviewService._create() {
    _instance ??= (AppServicesConfig.isTest) ? CustomChromeWebviewService() : CustomChromeWebviewService();

    return _instance!;
  }

  static WebviewService get instance => WebviewService._create();

  Future<void> open({required Uri url});
}

