import 'package:flutter/material.dart';
import 'package:job_search/theme.dart';
import 'dart:math' as math;

import '../../models/reminder_card_props.dart';

class ReminderCard extends StatefulWidget {
  final ReminderCardProps props;
  final VoidCallback? onSwipeRightEnd;
  final double contaierWidth;
  final bool showContent;
  final bool swipeRight;
  final Widget content;
  const ReminderCard(
      {Key? key,
      required this.props,
      required this.onSwipeRightEnd,
      required this.contaierWidth,
      required this.showContent,
      required this.swipeRight,
      required this.content})
      : super(key: key);

  @override
  State<ReminderCard> createState() => _ReminderCardState();
}

class _ReminderCardState extends State<ReminderCard> {
  final Duration animationsDuration = const Duration(milliseconds: 350);
  late Color myColor;
  late double leftOffset;

  @override
  void initState() {
    super.initState();
    leftOffset = (widget.contaierWidth - widget.props.width) * 0.5;
    myColor =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  @override
  void didUpdateWidget(covariant ReminderCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.swipeRight) {
      leftOffset = widget.contaierWidth;
    } else if (leftOffset != widget.contaierWidth) {
      leftOffset = (widget.contaierWidth - widget.props.width) * 0.5;
    }
  }

  @override
  Widget build(BuildContext context) {
    // assert(widget.props.opacity <= 1);
    return AnimatedPositioned(
      key: widget.key,
      top: widget.props.top,
      left: leftOffset,
      onEnd: () {
        if (widget.onSwipeRightEnd != null) {
          widget.onSwipeRightEnd!();
          dispose();
        }
      },
      duration: animationsDuration,
      child: AnimatedOpacity(
        opacity: widget.props.opacity,
        duration: animationsDuration,
        child: AnimatedContainer(
          duration: animationsDuration,
          width: widget.props.width,
          height: widget.props.height,
          child: Visibility(
            visible: widget.showContent,
            child: Center(child: widget.content),
          ),
          decoration: BoxDecoration(
              color: myColor, //.withOpacity(widget.props.opacity),
              borderRadius: BorderRadius.circular(widget.props.height * 0.2)),
        ),
      ),
    );
  }
}
