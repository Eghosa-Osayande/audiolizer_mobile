import 'dart:js' as js;

import 'package:audiolizer/modules/home/home_feed/services/webview_services.dart';


WebviewService getWebviewService() => PlatformWebviewService();

class PlatformWebviewService extends WebviewService {
  PlatformWebviewService();

  Future<void> open({required Uri url}) async {
    js.context.callMethod('open', [url.toString()]);
    //  js.context.callMethod('open', [url.toString(),'_self']);
  }
}
