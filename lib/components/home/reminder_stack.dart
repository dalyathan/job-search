import 'package:flutter/material.dart';

import 'reminder_card.dart';

class ReminderStack extends StatefulWidget {
  final double width;
  final double height;
  const ReminderStack({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  State<ReminderStack> createState() => _ReminderStackState();
}

class _ReminderStackState extends State<ReminderStack> {
  late double lastCardLeftOffset;
  bool isSwipeRight = false;
  late double lastCardStartOffset;
  late double gapBetweenCards;
  late double lastCardTopOffset;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lastCardStartOffset = widget.width * (1 - 0.9) * 0.5;
    lastCardLeftOffset = lastCardStartOffset;
    gapBetweenCards = widget.height * 0.075;
    lastCardTopOffset = 2 * gapBetweenCards;
  }

  @override
  Widget build(BuildContext context) {
    // double gap = widget.height * 0.075;
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 350),
            child: ReminderCard(
              width: widget.width * 0.7,
              opacity: 0.4,
              height: widget.height * 0.7,
            ),
          ),
          AnimatedPositioned(
            top: gapBetweenCards,
            duration: const Duration(milliseconds: 350),
            child: ReminderCard(
              width: widget.width * 0.8,
              opacity: 0.6,
              height: widget.height * 0.775,
            ),
          ),
          AnimatedPositioned(
            top: lastCardTopOffset,
            left: lastCardLeftOffset,
            duration: const Duration(milliseconds: 350),
            onEnd: () => setState(() {
              isSwipeRight = false;
              lastCardLeftOffset = lastCardStartOffset;
              lastCardTopOffset = gapBetweenCards;
            }),
            child: GestureDetector(
              onPanUpdate: (details) {
                if (details.delta.dx > 0 && isSwipeRight == false) {
                  setState(() {
                    isSwipeRight = true;
                  });
                }
              },
              onPanEnd: (details) {
                if (isSwipeRight) {
                  setState(() {
                    lastCardLeftOffset = widget.width;
                  });
                }
              },
              child: ReminderCard(
                width: widget.width * 0.9,
                opacity: 1,
                height: widget.height * 0.85,
              ),
            ),
          )
        ],
      ),
    );
  }
}
