class AppServicesConfig {
  static AppServicesConfig? _singleton;
  const AppServicesConfig._({required bool isTest}) : _isTest = isTest;

  factory AppServicesConfig({bool isTest = false}) {
    _singleton ??= AppServicesConfig._(isTest: isTest);
    return _singleton!;
  }
  final bool _isTest;

  static bool get isTest {
    return AppServicesConfig()._isTest;
  }
}
