import 'package:flutter/material.dart';
import 'package:audiolizer/modules/themes/colors/app_colors_dark.dart';
import 'package:audiolizer/modules/themes/colors/app_colors_light.dart';

abstract class AppColors {
  static AppColors get instance => (1 == 1) ? AppColorsDark() : AppColorsLight();

  Color get iconLight;
  Color get defaultTextColor;

  //

  final Color white = Color(0xFFFFFFFF);
  final Color black = Color.fromRGBO(0, 0, 0, 1);
  final transparent = Color.fromRGBO(0, 0, 0, 0);

  final Color primary = Colors.red;
  // final Color primary500 = Color(0xFF5700D8);
  // final Color primary400 = Color(0xFF742DDD);
  // final Color primary300 = Color(0xFF8549DF);
  // final Color primary200 = Color(0xFFB189EC);
  // final Color primary100 = Color(0xFFD6C1F4);

  final Color neutralActive = Color(0xFF0F1828);
  final Color neutralDark = Color(0xFF152033);
  final Color neutralBodyText = Color(0xFF1B2B48);
  final Color neutralSecondaryText = Color(0xFFA4A4A4);
  final Color neutralDisabled = Color(0xFFADB5BD);
  final Color neutralLine = Color(0xFFEDEDED);
  final Color neutralSecondaryBG = Color(0xFFF7F7FC);
  final Color neutralBG = Color(0xFFFFFFFF);
  final Color neutralOffWhite = Color(0xFFF7F7FC);

  final Color accentError = Color(0xFFE94242);
  final Color accentSuccess = Color(0xFF2CC069);
  final Color accentWarning = Color(0xFFFDCF41);
}
