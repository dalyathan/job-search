import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:job_search/components/home/vacancy.dart';
import 'package:job_search/theme.dart';

class Recommendations extends StatelessWidget {
  final double width;
  const Recommendations({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double vacancyWidth = width * 0.475;
    double vacancyHeight = size.height * 0.16;
    double titleRowHeight = size.height * 0.05;
    return Column(
      children: [
        SizedBox(
          height: titleRowHeight,
          // decoration:
          //     BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: width * 0.6,
                  height: titleRowHeight,
                  child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text("Recommendations",
                          style: MyTheme.style.copyWith(
                            color: MyTheme.blackish,
                          ))),
                  // decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.black, width: 2)),
                ),
                SizedBox(
                  width: width * 0.165,
                  height: titleRowHeight * 0.5,
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
        ),
        SizedBox(
          height: size.height * 0.025,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Vacancy(
              width: vacancyWidth,
              height: vacancyHeight,
              companyIcon: FontAwesomeIcons.google,
              companyName: 'Google',
              position: 'Product Designer',
              salaryRange: '\$100k-\$120k',
            ),
            Vacancy(
              width: vacancyWidth,
              height: vacancyHeight,
              companyIcon: FontAwesomeIcons.youtube,
              companyName: 'Youtube',
              position: 'UX/UI Designer',
              salaryRange: '\$150k',
            )
          ],
        ),
        SizedBox(
          height: size.height * 0.025,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Vacancy(
              width: vacancyWidth,
              height: vacancyHeight,
              companyIcon: FontAwesomeIcons.google,
              companyName: 'Google',
              position: 'Product Designer',
              salaryRange: '\$100k-\$120k',
            ),
            Vacancy(
              width: vacancyWidth,
              height: vacancyHeight,
              companyIcon: FontAwesomeIcons.youtube,
              companyName: 'Youtube',
              position: 'UX/UI Designer',
              salaryRange: '\$150k',
            )
          ],
        ),
      ],
    );
  }
}
