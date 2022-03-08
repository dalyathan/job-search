import 'package:flutter/material.dart';
import 'package:job_search/pages/home.dart';

import 'components/common/appbar.dart';
import 'components/common/navbar.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double horizontalPadding = size.width * 0.05;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              children: [
                CustomAppBar(
                  height: size.height * 0.075,
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                HomePage(
                  width: size.width - 2 * horizontalPadding,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavBar(height: size.height * 0.1),
      ),
    );
  }
}
