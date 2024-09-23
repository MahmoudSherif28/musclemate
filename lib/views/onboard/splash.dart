import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'onboarding.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 4000,
        pageTransitionType: PageTransitionType.rightToLeft,
        backgroundColor: const Color(0xffae6a46),
        splashIconSize: 250,
        splash: CircleAvatar(
          radius: 90,
          child: Lottie.asset('assets/img/new/Animation - 1727080966366.json',
              fit: BoxFit.cover),
        ),
        nextScreen: const FirstOnBoarding(),
      ),
    );
  }
}
