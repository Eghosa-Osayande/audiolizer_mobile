import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:solpha/modules/project_management/manage_score_settings/ui/create_project_page.dart';
import 'package:solpha/modules/themes/colors/app_colors.dart';

class OpenProjectFAB extends StatefulWidget {
  const OpenProjectFAB({
    Key? key,
  }) : super(key: key);

  @override
  State<OpenProjectFAB> createState() => OpenProjectFABState();
}

class OpenProjectFABState extends State<OpenProjectFAB> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  bool isFABClosed() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
       
        return isFABClosed();
      },
      child: FloatingActionBubble(
        items: <Bubble>[
          Bubble(
            title: "Open file",
            iconColor: AppColors.instance.iconLight,
            bubbleColor: AppColors.instance.primary,
            icon: Icons.file_open,
            titleStyle: TextStyle(
              fontSize: 16,
              color: AppColors.instance.iconLight,
            ),
            onPress: () {
              _animationController.reverse();
            },
          ),
          Bubble(
            title: "New Project",
            iconColor: AppColors.instance.iconLight,
            bubbleColor: AppColors.instance.primary,
            icon: Icons.add,
            titleStyle: TextStyle(
              fontSize: 16,
              color: AppColors.instance.iconLight,
            ),
            onPress: () {
              Navigator.of(context).push(CreateProjectPage.route());
              _animationController.reverse();
            },
          ),
        ],
        animation: _animation,
        onPress: () {
          _animationController.isCompleted ? _animationController.reverse() : _animationController.forward();
        },
        iconColor: AppColors.instance.iconLight,
        animatedIconData: AnimatedIcons.menu_close,
        backGroundColor: AppColors.instance.primary,
      ),
    );
  }
}
