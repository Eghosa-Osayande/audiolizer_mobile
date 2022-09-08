import 'package:flutter/material.dart';

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
      backgroundColor: Colors.red.withOpacity(0.4),
      body: Center(
        child: SizedBox.square(
          dimension: 250,
          child: Image.asset(
            'assets/images/logo_colored.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
