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
  bool isSwipeRight = false;
  late List<double> topOffsetStartValues;
  late List<ReminderCardProps> propsValueList;
  List<ReminderCardProps> propsStateList = [];
  late double gapBetweenCards;
  int currentCard = -1;
  int nextCard = 2;
  int numberOfCards = 3;

  @override
  void initState() {
    super.initState();
    List<double> heightValues = [
      widget.height * 0.7,
      widget.height * 0.775,
      widget.height * 0.85
    ];
    double gapBetweenCards =
        (widget.height - heightValues[heightValues.length - 1]) /
            (numberOfCards - 1);
    topOffsetStartValues = [0, gapBetweenCards, 2 * gapBetweenCards];
    List<double> widthStartValues = [
      widget.width * 0.8,
      widget.width * 0.9,
      widget.width
    ];
    List<double> opacityStartValues = [0.4, 0.6, 1];
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
      )
    ];
    for (ReminderCardProps propValue in propsValueList) {
      propsStateList.add(propValue);
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
          children: [
            ReminderCard(
              key: const Key('0'),
              props: propsStateList[0],
              onSwipeRightEnd: null,
              contaierWidth: widget.width,
              showContent: nextCard == 0,
              swipeRight: false,
              content: const Text("No more notifications",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            ReminderCard(
              key: const Key('1'),
              props: propsStateList[1],
              onSwipeRightEnd: currentCard == 1 ? () => swipe(1) : null,
              contaierWidth: widget.width,
              showContent: nextCard == 1,
              swipeRight: currentCard == 1,
              content: const Text("1",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            ReminderCard(
              key: const Key('2'),
              props: propsStateList[2],
              onSwipeRightEnd: currentCard == 2 ? () => swipe(2) : null,
              contaierWidth: widget.width,
              showContent: nextCard == 2,
              swipeRight: currentCard == 2,
              content: const Text("2",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            )
          ],
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
    setState(() {
      nextCard = upto - 1;
      currentCard = -1;
      isSwipeRight = false;
      propsStateList = dummyprops;
    });
  }
}
