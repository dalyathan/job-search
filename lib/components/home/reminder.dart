import 'package:flutter/material.dart';

class Reminder extends StatelessWidget {
  final double width;
  final double height;
  const Reminder({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width * 0.35,
            height: height * 0.2,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2)),
          ),
          Container(
            width: width,
            height: height * 0.65,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2)),
          )
        ],
      ),
    );
  }
}
