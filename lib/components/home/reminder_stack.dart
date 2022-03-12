import 'package:flutter/material.dart';
import 'package:job_search/models/reminder_card_props.dart';

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
  bool isSwipeRight = false;
  late List<double> topOffsetStartValues;
  // late List<double> leftOffsetStartValues;
  // late List<double> widthStartValues;
  // late List<double> opacityStartValues;
  late List<ReminderCardProps> propsList;
  // late List<double> heightValues;
  late ReminderCardProps card0Props;
  late ReminderCardProps card1Props;
  late ReminderCardProps card2Props;
  late double gapBetweenCards;
  int currentCard = -1;
  int nextCard = 2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    double gapBetweenCards = widget.height * 0.075;
    topOffsetStartValues = [0, gapBetweenCards, 2 * gapBetweenCards];
    List<double> widthStartValues = [
      widget.width * 0.8,
      widget.width * 0.9,
      widget.width
    ];
    // List<double> leftOffsetStartValues = [
    //   (widget.width - widthStartValues[0]) * 0.5,
    //   (widget.width - widthStartValues[1]) * 0.5,
    //   (widget.width - widthStartValues[2]) * 0.5
    // ];
    List<double> opacityStartValues = [0.4, 0.6, 1];
    List<double> heightValues = [
      widget.height * 0.7,
      widget.height * 0.775,
      widget.height * 0.85
    ];
    propsList = [
      ReminderCardProps(
        widthStartValues[0],
        heightValues[0],
        opacityStartValues[0],
        topOffsetStartValues[0],
        // leftOffsetStartValues[0],
      ),
      ReminderCardProps(
        widthStartValues[1],
        heightValues[1],
        opacityStartValues[1],
        topOffsetStartValues[1],
        // leftOffsetStartValues[1],
      ),
      ReminderCardProps(
        widthStartValues[2],
        heightValues[2],
        opacityStartValues[2],
        topOffsetStartValues[2],
        // leftOffsetStartValues[2],
      )
    ];
    card0Props = propsList[0];
    card1Props = propsList[1];
    card2Props = propsList[2];
  }

  @override
  Widget build(BuildContext context) {
    // double gap = widget.height * 0.075;
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
              props: card0Props,
              onSwipeRightEnd: currentCard == 0
                  ? () => setState(() {
                        nextCard = 2;
                        currentCard = -1;
                        isSwipeRight = false;
                        card0Props = propsList[0];
                        card1Props = propsList[1];
                        card2Props = propsList[2];
                      })
                  : null,
              contaierWidth: widget.width,
              leftOffset: currentCard == 0
                  ? widget.width
                  : ((widget.width - card0Props.width) * 0.5),
            ),
            ReminderCard(
              key: const Key('1'),
              props: card1Props,
              onSwipeRightEnd: currentCard == 1
                  ? () => setState(() {
                        nextCard = 0;
                        currentCard = -1;
                        isSwipeRight = false;
                        card0Props = propsList[2];
                        card1Props = propsList[0];
                        card2Props = propsList[1];
                      })
                  : null,
              contaierWidth: widget.width,
              leftOffset: currentCard == 1
                  ? widget.width
                  : ((widget.width - card1Props.width) * 0.5),
            ),
            ReminderCard(
              key: const Key('2'),
              props: card2Props,
              onSwipeRightEnd: currentCard == 2
                  ? () => setState(() {
                        nextCard = 1;
                        currentCard = -1;
                        isSwipeRight = false;
                        card1Props = propsList[2];
                        card0Props = propsList[1];
                        card2Props = propsList[0];
                      })
                  : null,
              contaierWidth: widget.width,
              leftOffset: currentCard == 2
                  ? widget.width
                  : ((widget.width - card2Props.width) * 0.5),
            )
          ],
        ),
      ),
    );
  }
}
