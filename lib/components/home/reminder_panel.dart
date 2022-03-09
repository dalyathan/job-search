import 'package:flutter/material.dart';
import 'package:job_search/theme.dart';

class ReminderPanel extends StatelessWidget {
  final double width;
  final double opacity;
  final double height;
  const ReminderPanel(
      {Key? key,
      required this.width,
      required this.opacity,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(opacity <= 1);
    // double aspectRatio = 2.25;
    // double height = width / aspectRatio;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: MyTheme.greenish.withOpacity(opacity),
          borderRadius: BorderRadius.circular(height * 0.2)),
    );
  }
}
