import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'onboarding.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: splash(),
    );
  }
}

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 3,
        pageTransitionType: PageTransitionType.rightToLeft,
        backgroundColor: const Color(0xffae6a46),
        splashIconSize: 250,
        splash: const CircleAvatar(
            radius: 90,
            backgroundImage: AssetImage("assets/img/new/splash.jpg")),
        nextScreen: const FirstOnBoarding(),
      ),
    );
  }
}
