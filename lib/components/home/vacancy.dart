import 'package:flutter/material.dart';
import 'package:job_search/icons/save.dart';
import 'package:job_search/theme.dart';

class Vacancy extends StatelessWidget {
  final double width;
  final double height;
  final IconData companyIcon;
  final String companyName;
  final String position;
  final String salaryRange;
  const Vacancy(
      {Key? key,
      required this.width,
      required this.height,
      required this.companyIcon,
      required this.companyName,
      required this.position,
      required this.salaryRange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(height * 0.1);
    var iconRowHeight = height * 0.375;
    var contentWidth = width * 0.8;
    return Material(
      borderRadius: borderRadius,
      shadowColor: Colors.white30,
      elevation: 10,
      child: Container(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: iconRowHeight,
              width: contentWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(companyIcon, size: width * 0.12),
                  SaveIcon(isSaved: false, size: width * 0.12)
                ],
              ),
            ),
            SizedBox(
              height: height - iconRowHeight,
              width: contentWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    companyName,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    position,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: salaryRange,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    const TextSpan(
                        text: ' /year',
                        style: TextStyle(
                          color: Colors.black,
                        )),
                  ]))
                ],
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
