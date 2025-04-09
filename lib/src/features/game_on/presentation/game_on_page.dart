import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_on/src/features/organizers/presentation/pages/organizer_page.dart';

import '../../../config/themes/app_colors.dart';
import '../../../core/resources/app_icons.dart';
import '../../home/presentantion/home_page.dart';

class GameOnPage extends StatefulWidget {
  const GameOnPage({super.key});

  @override
  State<GameOnPage> createState() => _GameOnPageState();
}

class _GameOnPageState extends State<GameOnPage> {
  var _currentIndex = 0;

  List<Widget> widgets = [
    HomePage(),
    OrganizerPage(),
    Text("3"),
    Text("4"),
    Text("4"),
  ];

  List<String> iconList = [
    AppIcons.houseChimney,
    AppIcons.whistle,
    AppIcons.memoPad,
    AppIcons.videoCameraAlt,
    AppIcons.user
  ];

  List<String> iconListBold = [
    AppIcons.houseChimneyBold,
    AppIcons.whistleBold,
    AppIcons.memoPadBold,
    AppIcons.videoCameraAltBold,
    AppIcons.userBold
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        backgroundColor: Colors.white,
        itemCount: 5,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        height: 60,
        shadow: BoxShadow(
          color: AppColors.shadow.withOpacity(.1),
          blurRadius: 100,
        ),
        onTap: (index) => setState(() => _currentIndex = index),
        tabBuilder: (int index, bool isActive) {
          return IconButton(
            icon: SvgPicture.asset(
              (isActive) ? iconListBold[index] : iconList[index],
              width: 20,
              color:
                  (isActive) ? AppColors.primary : Colors.black.withOpacity(.6),
            ),
            onPressed: () => setState(() => _currentIndex = index),
          );
        },
      ),
    );
  }
}
