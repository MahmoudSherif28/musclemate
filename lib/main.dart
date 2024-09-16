import 'package:flutter/material.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/views/menu/menu_view.dart';
import 'package:musclemate/views/onboard/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Fitness',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Quicksand",
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.kPrimaryColor),
        useMaterial3: false,
      ),
      home: const splash(),
    );
  }
}
