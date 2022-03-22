import 'package:flutter/material.dart';
import 'package:job_search/components/home/vacancy.dart';
import 'package:job_search/theme.dart';

class Recommendations extends StatelessWidget {
  final double width;
  const Recommendations({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double vacancyWidth = width * 0.475;
    double vacancyHeight = size.height * 0.2;
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: width * 0.6,
                height: size.height * 0.05,
                child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text("Recommendations",
                        style: MyTheme.style.copyWith(
                          color: MyTheme.blackish,
                        ))),
                // decoration: BoxDecoration(
                //     border: Border.all(color: Colors.black, width: 2)),
              ),
              Container(
                width: width * 0.165,
                height: size.height * 0.0275,
                child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text("See all",
                        style: MyTheme.style.copyWith(
                          color: Colors.grey,
                        ))),
                // decoration: BoxDecoration(
                //     border: Border.all(color: Colors.black, width: 2)),
              )
            ]),
        SizedBox(
          height: size.height * 0.025,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Vacancy(width: vacancyWidth, height: vacancyHeight),
            Vacancy(width: vacancyWidth, height: vacancyHeight)
          ],
        )
      ],
    );
  }
}
