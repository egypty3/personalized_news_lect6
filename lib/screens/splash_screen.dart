import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:the_app/screens/home_screen.dart';
import 'package:the_app/utils/appcolors.dart';
import 'package:the_app/utils/appconstants.dart';
import 'package:the_app/utils/helper/data_functions.dart';
import 'package:the_app/widgets/apptext.dart';

import 'on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  DataHandler dataHandler = DataHandler();
  String doneOnboarding = "";

  void readData() async {
    doneOnboarding =
        await dataHandler.getStringValue(AppConstants.doneOnboarding);
  }

  @override
  void initState() {
    readData();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => doneOnboarding == "YES"
                    ? HomeScreen()
                    : OnBoardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: 'H I G H L I G H T S',
              color: Colors.black,
              fontSize: 28,
            ),
            SizedBox(
              height: 100,
            ),
            CupertinoActivityIndicator()
          ],
        ),
      ),
    );
  }
}
