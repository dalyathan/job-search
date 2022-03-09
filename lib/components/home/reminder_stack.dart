import 'package:flutter/material.dart';

import 'reminder_panel.dart';

class ReminderStack extends StatelessWidget {
  final double width;
  final double height;
  const ReminderStack({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gap = height * 0.075;
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          ReminderPanel(
            width: width * 0.7,
            opacity: 0.4,
            height: height * 0.7,
          ),
          Positioned(
              top: gap,
              child: ReminderPanel(
                width: width * 0.8,
                opacity: 0.6,
                height: height * 0.775,
              )),
          Positioned(
              top: gap * 2,
              child: ReminderPanel(
                width: width * 0.9,
                opacity: 1,
                height: height * 0.85,
              ))
        ],
      ),
    );
  }
}
