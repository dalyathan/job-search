import 'package:flutter/material.dart';
import 'package:job_search/icons/home.dart';
import 'package:job_search/icons/home_active.dart';

class NavBar extends StatelessWidget {
  final double height;
  const NavBar({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double paddingWidth = size.width * 0.05;
    double paddingHeight = height * 0.1;
    double contentWidth = size.width - 2 * paddingWidth;
    double contentHeight = height - 2 * paddingHeight;
    double barItemWidth = contentWidth * 0.175;
    double barItemHeight = contentHeight * 0.3, iconHeight = barItemHeight;
    double iconWidth = barItemWidth * 0.25;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: paddingHeight, horizontal: paddingWidth),
      child: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            label: "",
            activeIcon:
                HomeActiveIcon(height: barItemHeight, width: barItemWidth),
            icon: HomeIcon(selected: false, size: iconHeight)),
        BottomNavigationBarItem(
            label: "",
            activeIcon:
                HomeActiveIcon(height: barItemHeight, width: barItemWidth),
            icon: HomeIcon(selected: false, size: iconHeight))
      ]),
    );
  }
}
