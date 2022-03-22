import 'package:flutter/material.dart';
import 'package:job_search/theme.dart';

class SaveIcon extends StatelessWidget {
  final bool isSaved;
  final double size;
  const SaveIcon({Key? key, required this.isSaved, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: MyTheme.greenish,
      child: Stack(alignment: Alignment.center, children: [
        Positioned(
          top: size * 0.3,
          child: Icon(
            Icons.check,
            color: MyTheme.greenish,
            size: size * 0.3,
          ),
        ),
        Icon(
          Icons.bookmark_border_outlined,
          color: MyTheme.greenish,
          size: size,
        ),
      ]),
    );
  }
}
