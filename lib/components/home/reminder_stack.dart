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
  late ReminderCardProps lastCardProps;
  late ReminderCardProps middleCardProps;
  late ReminderCardProps frontCardProps;

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
    lastCardProps = propsList[0];
    middleCardProps = propsList[1];
    frontCardProps = propsList[2];
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
          ReminderCard(
            props: lastCardProps,
            onSwipeRightEnd: null,
            contaierWidth: widget.width,
          ),
          ReminderCard(
            props: middleCardProps,
            onSwipeRightEnd: () => setState(() {
              lastCardProps = propsList[2];
            }),
            contaierWidth: widget.width,
          ),
          ReminderCard(
            props: frontCardProps,
            onSwipeRightEnd: () => setState(() {
              middleCardProps = propsList[2];
              lastCardProps = propsList[1];
            }),
            contaierWidth: widget.width,
          )
        ],
      ),
    );
  }
}
