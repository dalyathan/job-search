import 'package:flutter/material.dart';
import 'package:job_search/theme.dart';

import '../../models/reminder_card_props.dart';

class ReminderCard extends StatefulWidget {
  final ReminderCardProps props;
  final VoidCallback? onSwipeRightEnd;
  final double contaierWidth;
  final ReminderCardProps backProps;
  const ReminderCard({
    Key? key,
    required this.props,
    required this.onSwipeRightEnd,
    required this.contaierWidth,
    required this.backProps,
  }) : super(key: key);

  @override
  State<ReminderCard> createState() => _ReminderCardState();
}

class _ReminderCardState extends State<ReminderCard> {
  bool swipeRightAlreadyDetected = false;
  late Duration animationsDuration;
  late double currentLeft;
  //late ReminderCardProps currentProps;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationsDuration = const Duration(milliseconds: 350);
    currentLeft = (widget.contaierWidth - widget.props.width) * 0.5;
    //currentProps = widget.props;
  }

  @override
  Widget build(BuildContext context) {
    assert(widget.props.opacity <= 1);
    return AnimatedPositioned(
      top: widget.props.top,
      left: swipeRightAlreadyDetected
          ? currentLeft
          : (widget.contaierWidth - widget.props.width) * 0.5,
      onEnd: () {
        if (swipeRightAlreadyDetected && widget.onSwipeRightEnd != null) {
          widget.onSwipeRightEnd!();
          setState(() {
            swipeRightAlreadyDetected = false;
          });
        }
      },
      duration: animationsDuration,
      child: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 0 && swipeRightAlreadyDetected == false) {
            setState(() {
              swipeRightAlreadyDetected = true;
            });
          }
        },
        onPanEnd: (details) {
          if (swipeRightAlreadyDetected) {
            setState(() {
              currentLeft = widget.contaierWidth;
            });
          }
        },
        child: AnimatedContainer(
          duration: animationsDuration,
          width: widget.props.width,
          height: widget.props.height,
          decoration: BoxDecoration(
              color: MyTheme.greenish.withOpacity(widget.props.opacity),
              borderRadius: BorderRadius.circular(widget.props.height * 0.2)),
        ),
      ),
    );
  }
}
