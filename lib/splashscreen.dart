import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:coba_flutter/Home.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  List<String> imageAssets = [
    'assets/anime1.json',
    'assets/anime2.json',
    'assets/anime3.json',
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentPage < imageAssets.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageWidth = screenWidth;

    return AnimatedSplashScreen(
      splash: Container(
        width: imageWidth,
        child: Lottie.asset(
          imageAssets[currentPage],
          width: imageWidth,
        ),
      ),
      duration: 25000,
      splashIconSize: imageWidth,
      backgroundColor: Colors.black,
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
      nextScreen: HomePage(),
    );
  }
}
