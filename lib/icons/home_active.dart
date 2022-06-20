import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_search/icons/home.dart';
import 'package:job_search/theme.dart';

class HomeActiveIcon extends StatelessWidget {
  final double height;
  final double width;
  const HomeActiveIcon({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HomeIcon(selected: true, size: height),
        const Text(
          "Home",
          style: TextStyle(color: MyTheme.blackish),
        )
      ],
    );
  }
}
