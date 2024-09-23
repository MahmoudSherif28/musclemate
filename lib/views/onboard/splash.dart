import 'package:flutter/material.dart';
import 'dart:async';
import 'onboarding.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  bool _isLogoInPosition = false;
  List<bool> _isLetterVisible =
      List.generate(11, (_) => false); // For 11 letters

  late AnimationController _logoController;
  late Animation<double> _logoAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller for the logo position
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Define a tween for moving the logo from top to bottom
    _logoAnimation = Tween<double>(begin: -300, end: 0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: Curves.easeOut,
      ),
    );

    _startAnimations();
    _navigateToOnboarding();
  }

  // Starts the animation by moving the logo and revealing letters
  void _startAnimations() {
    Future.delayed(const Duration(milliseconds: 500), () {
      _logoController.forward(); // Start the logo movement

      // Show the letters one by one
      for (int i = 0; i < _isLetterVisible.length; i++) {
        Future.delayed(Duration(milliseconds: 300 * i), () {
          setState(() {
            _isLetterVisible[i] = true;
          });
        });
      }
    });
  }

  // Navigate to the onboarding screen after the splash duration
  void _navigateToOnboarding() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FirstOnBoarding()),
      );
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xfff8c291),
                  Color(0xff964B00),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _logoController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _logoAnimation.value),
                        child: CircleAvatar(
                          radius: 120,
                          backgroundImage: AssetImage("assets/img/new/17.jpg"),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildLetterAnimations(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Create a list of widgets for each letter in "Muscle Mate"
  List<Widget> _buildLetterAnimations() {
    const String text = "Muscle Mate";
    return List<Widget>.generate(text.length, (index) {
      return AnimatedOpacity(
        opacity: _isLetterVisible[index] ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: Text(
          text[index],
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
            shadows: [
              Shadow(
                blurRadius: 8,
                color: Colors.black38,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
      );
    });
  }
}
