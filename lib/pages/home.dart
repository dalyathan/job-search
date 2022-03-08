import 'package:flutter/material.dart';
import 'package:job_search/components/home/recommendations.dart';
import 'package:job_search/components/home/reminder.dart';

import '../components/home/search_job.dart';

class HomePage extends StatelessWidget {
  final double width;
  const HomePage({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var fixedSpace = SizedBox(
      height: size.height * 0.05,
    );
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchJob(
            width: width,
            height: size.height * 0.15,
          ),
          fixedSpace,
          Reminder(width: width, height: size.height * 0.25),
          fixedSpace,
          Recommendations(width: width)
        ],
      ),
    );
  }
}
