import 'dart:async';

import 'package:audiolizer/modules/app_services_controller/services_config.dart';
import 'package:audiolizer/modules/firebase/firebase_service.dart';
import 'package:hive/hive.dart';

class OnBoardingRepo {
  static OnBoardingRepo? _instance;

  OnBoardingRepo._();

  factory OnBoardingRepo._create() {
    _instance ??= (AppServicesConfig.isTest) ? OnBoardingRepo._() : OnBoardingRepo._();

    return _instance!;
  }

  static OnBoardingRepo get instance => OnBoardingRepo._create();

  Future<Box<String>> _getBox() async => await Hive.openBox<String>('onboarding');
  Future<Box<bool>> _getHasOnboardedBox() async => await Hive.openBox<bool>('hasBoarded');

  Future<bool> shouldDoOnBoarding() async {
    var box = await _getBox();
    if (box.isEmpty) {
      return true;
    }
    _logEvents();
    return false;
  }

  Future<void> put(List<String> events) async {
    var box = await _getBox();
    await box.clear();
    await box.addAll(events);
    await _logEvents();
  }

  Future<void> _logEvents() async {
    Box box2 = await _getHasOnboardedBox();
    var box = await _getBox();
    if (box2.isEmpty) {
      for (String event in box.values) {
        await FirebaseService.instance.logEvent(name: event);
      }
      box2.add(true);
    }
  }
}
