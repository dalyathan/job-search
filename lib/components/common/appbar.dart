import 'package:flutter/material.dart';
import 'package:job_search/theme.dart';

class CustomAppBar extends StatelessWidget {
  final double height;
  const CustomAppBar({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double iconBoxSize = height * 0.8;
    return SizedBox(
      width: size.width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: iconBoxSize,
            height: iconBoxSize,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(iconBoxSize * 0.2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.01),
                    spreadRadius: 5,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  )
                ]),
            child: Icon(
              Icons.menu,
              size: iconBoxSize * 0.75,
            ),
          ),
          Container(
            width: iconBoxSize,
            height: iconBoxSize,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(iconBoxSize * 0.2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.01),
                    spreadRadius: 5,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  )
                ]),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.notifications_none_outlined,
                  size: iconBoxSize * 0.75,
                ),
                Positioned(
                  top: iconBoxSize * 0.2,
                  right: iconBoxSize * 0.225,
                  child: Container(
                    width: iconBoxSize * 0.25,
                    height: iconBoxSize * 0.25,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyTheme.greenish,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      // decoration:
      //     BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
    );
  }
}
