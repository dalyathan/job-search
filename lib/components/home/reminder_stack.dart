import 'package:flutter/material.dart';
import 'package:job_search/models/reminder_card_props.dart';

import 'reminder_card.dart';

class ReminderStack extends StatefulWidget {
  final double width;
  final double height;
  const ReminderStack({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  State<ReminderStack> createState() => _ReminderStackState();
}

class _ReminderStackState extends State<ReminderStack> {
  static const windowSize = 3;
  bool isSwipeRight = false;
  late int windowStart;
  late int windowEnd;
  late List<double> topOffsetStartValues;
  late List<ReminderCardProps> propsValueList;
  List<ReminderCardProps> propsStateList = [];
  late double gapBetweenCards;
  int currentCard = -1;
  late int nextCard;
  late int numberOfCards;

  @override
  void initState() {
    super.initState();
    List<double> heightValues = [
      widget.height * 0.325,
      widget.height * 0.4,
      widget.height * 0.475,
      widget.height * 0.55,
      widget.height * 0.625,
      widget.height * 0.7,
      widget.height * 0.775,
      widget.height * 0.85
    ];
    numberOfCards = heightValues.length;
    windowEnd = numberOfCards - 1;
    windowStart = windowEnd - windowSize + 1;
    nextCard = numberOfCards - 1;
    double gapBetweenCards =
        (widget.height - heightValues[heightValues.length - 1]) /
            (numberOfCards - 1);
    topOffsetStartValues = [
      0,
      1 * gapBetweenCards,
      2 * gapBetweenCards,
      3 * gapBetweenCards,
      4 * gapBetweenCards,
      5 * gapBetweenCards,
      6 * gapBetweenCards,
      7 * gapBetweenCards
    ];
    List<double> widthStartValues = [
      widget.width * 0.65,
      widget.width * 0.7,
      widget.width * 0.75,
      widget.width * 0.8,
      widget.width * 0.85,
      widget.width * 0.9,
      widget.width * 0.95,
      widget.width
    ];
    List<double> opacityStartValues = [0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
    propsValueList = [
      ReminderCardProps(
        widthStartValues[0],
        heightValues[0],
        opacityStartValues[0],
        topOffsetStartValues[0],
      ),
      ReminderCardProps(
        widthStartValues[1],
        heightValues[1],
        opacityStartValues[1],
        topOffsetStartValues[1],
      ),
      ReminderCardProps(
        widthStartValues[2],
        heightValues[2],
        opacityStartValues[2],
        topOffsetStartValues[2],
      ),
      ReminderCardProps(
        widthStartValues[3],
        heightValues[3],
        opacityStartValues[3],
        topOffsetStartValues[3],
      ),
      ReminderCardProps(
        widthStartValues[4],
        heightValues[4],
        opacityStartValues[4],
        topOffsetStartValues[4],
      ),
      ReminderCardProps(
        widthStartValues[5],
        heightValues[5],
        opacityStartValues[5],
        topOffsetStartValues[5],
      ),
      ReminderCardProps(
        widthStartValues[6],
        heightValues[6],
        opacityStartValues[6],
        topOffsetStartValues[6],
      ),
      ReminderCardProps(
        widthStartValues[7],
        heightValues[7],
        opacityStartValues[7],
        topOffsetStartValues[7],
      )
    ];
    for (ReminderCardProps propValue in propsValueList) {
      propsStateList.add(propValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    var subList = propsStateList.sublist(windowStart, windowEnd + 1);
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
                          //key: Key('${propsStateList.indexOf(value)}'),
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
                    .toList()
            //.sublist(windowStart),
            // ReminderCard(
            //   key: const Key('1'),
            //   props: propsStateList[1],
            //   onSwipeRightEnd: currentCard == 1 ? () => swipe(1) : null,
            //   contaierWidth: widget.width,
            //   showContent: nextCard == 1,
            //   swipeRight: currentCard == 1,
            //   content: const Text("1",
            //       style: TextStyle(
            //         color: Colors.white,
            //       )),
            // ),
            // ReminderCard(
            //   key: const Key('2'),
            //   props: propsStateList[2],
            //   onSwipeRightEnd: currentCard == 2 ? () => swipe(2) : null,
            //   contaierWidth: widget.width,
            //   showContent: nextCard == 2,
            //   swipeRight: currentCard == 2,
            //   content: const Text("2",
            //       style: TextStyle(
            //         color: Colors.white,
            //       )),
            // )
            // ],
            ),
      ),
    );
  }

  swipe(int upto, {bool isRight = true}) {
    List<ReminderCardProps> dummyprops = [];
    for (ReminderCardProps stateValues in propsStateList) {
      dummyprops.add(stateValues);
    }
    //int length = dummyprops.length;
    if (isRight) {
      for (int start = 0; start < upto; start++) {
        dummyprops[start] = propsStateList[start + 1];
      }
    }
    // } else {
    //   for (int start = 0; start < upto; start++) {
    //     dummyprops[start] = propsStateList[start - 1];
    //   }
    // }
    setState(() {
      nextCard = upto - 1;
      currentCard = -1;
      windowStart = windowStart > 0 ? windowStart - 1 : 0;
      windowEnd -= 1;
      isSwipeRight = false;
      propsStateList = dummyprops;
    });
  }
}
