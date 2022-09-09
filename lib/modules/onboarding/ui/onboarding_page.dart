import 'package:audiolizer/modules/onboarding/repo/onboarding_repo.dart';
import 'package:audiolizer/modules/themes/colors/app_colors.dart';
import 'package:audiolizer/modules/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  static String path = '/onboarding';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: path),
      builder: (_) => OnBoardingPage(),
    );
  }

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  List<String> options = [
    'Singer',
    'Instrumentalist',
    'Choir director',
    'Chorister',
    'Music student',
    'Hobbyist musician',
    'Professional musician',
    'Familiar with tonic solfa',
    'New to tonic solfa',
    'I want to improve my sight singing',
    'I want to improve my relative pitch',
    'Music tutor'
  ];
  late List<bool> isSelected = options.map((e) => false).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      floatingActionButton: Builder(
        builder: (context) {
          bool isEnabled = (isSelected.any((element) => element == true));
          return Opacity(
            opacity: isEnabled ? 1 : 0.7,
            child: ElevatedButton(
              onPressed: isEnabled ? () => onContinue(context) : null,
              child: Text("Continue"),
            ),
          );
        },
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned.fill(
            child: Container(
              margin: EdgeInsets.all(16),
              child: Opacity(
                opacity: 0.3,
                child: Center(
                  child: SvgPicture.string(kLogoSvg),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 34),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Welcome to ',
                          ),
                          TextSpan(text: 'Audiolizer', style: TextStyle(fontFamily: 'Logo')),
                        ],
                      ),
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "We appreciate your choice to  use our music notation app. Help us know you better by picking any option(s) that best describes you",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Wrap(
                          children: List.generate(
                            options.length,
                            (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  var oldValue = isSelected[index];
                                  isSelected[index] = !oldValue;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                child: Chip(
                                  label: Text(
                                    options[index],
                                  ),
                                  backgroundColor: isSelected[index] ? AppColors.instance.primary : null,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onContinue(BuildContext context) async {
    List<String> events = [];
    isSelected.fold<int>(0, (index, element) {
      if (element == true) {
        events.add(options[index]);
      }
      return index + 1;
    });
    print(events);
    OnBoardingRepo.instance.put(events);
    Navigator.pop(context);
  }
}
