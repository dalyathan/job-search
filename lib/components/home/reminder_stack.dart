import 'dart:math';

import 'package:flutter/material.dart';
import 'package:job_search/models/reminder_card_props.dart';

import 'reminder_card.dart';

class ReminderStack extends StatefulWidget {
  final double width;
  final double height;
  final List<Widget> contents;
  const ReminderStack(
      {Key? key,
      required this.width,
      required this.height,
      required this.contents})
      : super(key: key);

  @override
  State<ReminderStack> createState() => _ReminderStackState();
}

class _ReminderStackState extends State<ReminderStack> {
  bool isSwipeRight = false;
  List<ReminderCardProps> propsStateList = [];
  late double gapBetweenCards;
  int currentCard = -1;
  late int nextCard;
  late int numberOfCards;
  static const double maxOpacity = 1;
  static const double minOpacity = 0.3;
  static const double minWidthRatio = 0.65;
  static const double maxWidthRatio = 1;
  static const double minHeightRatio = 0.325;
  static const double maxHeightRatio = 0.85;

  @override
  void initState() {
    super.initState();
    numberOfCards = 10;
    List<double> heightValues = getThisAmountIncludingBetween(
        minHeightRatio, maxHeightRatio, numberOfCards + 1, widget.height);
    nextCard = numberOfCards;
    double maxGap = widget.height - heightValues.last;
    List<double> topOffsetStartValues =
        getThisAmountIncludingBetween(-1, 1, numberOfCards + 1, maxGap);
    List<double> widthStartValues = getThisAmountIncludingBetween(
        minWidthRatio, maxWidthRatio, numberOfCards + 1, widget.width);
    List<double> opacityStartValues = getThisAmountIncludingBetween(
        minOpacity, maxOpacity, numberOfCards + 1, 1);
    for (double width in widthStartValues) {
      int index = widthStartValues.indexOf(width);
      propsStateList.add(ReminderCardProps(
        width,
        heightValues[index],
        opacityStartValues[index],
        topOffsetStartValues[index],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 0 &&
              isSwipeRight == false &&
              currentCard == -1) {
            setState(() {
              isSwipeRight = true;
            });
          }
        },
        onPanEnd: (details) {
          if (isSwipeRight) {
            setState(() {
              currentCard = nextCard;
            });
          }
        },
        child: Stack(
            alignment: Alignment.topCenter,
            children: //[
                propsStateList
                    .map((value) => ReminderCard(
                          props: value,
                          onSwipeRightEnd: propsStateList.indexOf(value) == 0
                              ? null
                              : currentCard == propsStateList.indexOf(value)
                                  ? () => swipe(propsStateList.indexOf(value))
                                  : null,
                          contaierWidth: widget.width,
                          showContent:
                              nextCard == propsStateList.indexOf(value),
                          swipeRight: propsStateList.indexOf(value) == 0
                              ? false
                              : currentCard == propsStateList.indexOf(value),
                          content: Text(
                              propsStateList.indexOf(value) == 0
                                  ? "No more notifications"
                                  : '${propsStateList.indexOf(value)}',
                              style: const TextStyle(
                                color: Colors.white,
                              )),
                        ))
                    .toList()),
      ),
    );
  }

  swipe(int upto, {bool isRight = true}) {
    List<ReminderCardProps> dummyprops = [];
    for (ReminderCardProps stateValues in propsStateList) {
      dummyprops.add(stateValues);
    }
    if (isRight) {
      for (int start = 0; start < upto; start++) {
        dummyprops[start] = propsStateList[start + 1];
      }
    }
    setState(() {
      nextCard = upto - 1;
      currentCard = -1;
      isSwipeRight = false;
      propsStateList = dummyprops;
    });
  }

  List<double> getThisAmountIncludingBetween(
      double min, double max, int amount, double multiplyer) {
    double gap = max - min;
    double step = gap / (amount - 1);
    List<double> values = [max * multiplyer];
    double prev = max;
    while (values.length < amount) {
      prev = prev - step;
      values.insert(0, prev * multiplyer);
    }
    return values;
  }
}
