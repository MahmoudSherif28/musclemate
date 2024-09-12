import 'package:flutter/material.dart';
import 'package:musclemate/views/menu/yoga_view.dart';
import 'package:musclemate/views/running/running_view.dart';
import 'package:musclemate/views/workout/workout_view.dart';

void drawerNavigation(int index, BuildContext context) {
  Navigator.pop(context);

  if (index == 0) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RunningView(),
      ),
    );
  } else if (index == 1) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const YogaView(),
      ),
    );
  } else if (index == 2) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WorkoutView(),
      ),
    );
  } else if (index == 3) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RunningView(),
      ),
    );
  }
}
