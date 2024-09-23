import 'package:flutter/material.dart';
import 'package:musclemate/views/exercise/exercise_view_2.dart';
import 'package:musclemate/views/home_view.dart';
import 'package:musclemate/views/meal_plan/meal_plan_view_2.dart';
import 'package:musclemate/views/running/running_view.dart';
import 'package:musclemate/views/schedule/schedule_view.dart';
import 'package:musclemate/views/settings/setting_view.dart';
import 'package:musclemate/views/tips/tips_view.dart';
import 'package:musclemate/views/weight/weight_view.dart';

void menuTapMethod(String tag, BuildContext context) {
  switch (tag) {
    case "1":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeView()));
      break;
    case "2":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const WeightView()));
      break;
    case "3":
      Scaffold.of(context).openDrawer();
      break;

    case "5":
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const MealPlanView2()));
      break;
    case "6":
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ScheduleView()));
      break;
    case "7":
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const RunningView()));
      break;
    case "8":
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ExerciseView2()));
      break;
    case "9":
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SettingsView()));
      break;
    case "10":
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const TipsView()));
      break;

    default:
  }
}
