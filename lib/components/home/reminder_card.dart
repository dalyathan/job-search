import 'package:flutter/material.dart';
import 'package:job_search/theme.dart';

import '../../models/reminder_card_props.dart';

class ReminderCard extends StatelessWidget {
  final ReminderCardProps props;
  final VoidCallback? onSwipeRightEnd;
  final double contaierWidth;
  final double leftOffset;
  const ReminderCard(
      {Key? key,
      required this.props,
      required this.onSwipeRightEnd,
      required this.contaierWidth,
      required this.leftOffset})
      : super(key: key);

  final Duration animationsDuration = const Duration(milliseconds: 350);
  //late ReminderCardProps currentProps;

  @override
  Widget build(BuildContext context) {
    assert(props.opacity <= 1);
    return AnimatedPositioned(
      key: key,
      top: props.top,
      left: leftOffset,
      onEnd: () {
        if (onSwipeRightEnd != null) {
          onSwipeRightEnd!();
        }
      },
      duration: animationsDuration,
      child: AnimatedContainer(
        duration: animationsDuration,
        width: props.width,
        height: props.height,
        child: Center(
            child: Text(
          key.toString(),
          style: const TextStyle(color: Colors.white),
        )),
        decoration: BoxDecoration(
            color: MyTheme.greenish.withOpacity(props.opacity),
            borderRadius: BorderRadius.circular(props.height * 0.2)),
      ),
    );
  }
}
