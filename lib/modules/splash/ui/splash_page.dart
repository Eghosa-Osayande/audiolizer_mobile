import 'package:audiolizer/modules/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  static String path = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: path),
      builder: (_) => SplashPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox.square(
          dimension: 180,
          child: SvgPicture.string(kLogoSvg),
        ),
      ),
    );
  }
}
