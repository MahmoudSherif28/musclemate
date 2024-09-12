import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/models/drawer_items_model.dart';
import 'package:musclemate/views/menu/yoga_view.dart';
import 'package:musclemate/views/running/running_view.dart';
import 'package:musclemate/views/workout/workout_view.dart';
import 'package:musclemate/widgets/custom_drawer_item_row.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  List<DrawerItemsModel> items = [
    DrawerItemsModel(
        icon: "assets/img/menu_running.png", name: "Running", rightIcon: ''),
    DrawerItemsModel(
        icon: "assets/img/yoga.png",
        name: "Yoga",
        rightIcon: 'assets/img/information.png'),
    DrawerItemsModel(
        icon: "assets/img/workout.png", name: "Workout", rightIcon: ''),
    DrawerItemsModel(
        icon: "assets/img/walking.png", name: "Walking", rightIcon: ''),
    DrawerItemsModel(
        icon: "assets/img/fitness.png",
        name: "Fitness",
        rightIcon: 'assets/img/information.png'),
    DrawerItemsModel(
        icon: "assets/img/strength.png", name: "Strength", rightIcon: ''),
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Drawer(
        width: media.width,
        backgroundColor: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5,
          ),
          child: Stack(
            children: [
              Container(
                width: media.width * 0.78,
                decoration: BoxDecoration(color: TColor.white),
                child: SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Column(
                    children: [
                      SizedBox(
                        height: kTextTabBarHeight,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(22.5),
                              child: Image.asset("assets/img/u1.png",
                                  width: 45, height: 45, fit: BoxFit.cover),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                "Traning Plan",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: TColor.secondaryText,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        color: Colors.black26,
                        height: 1,
                      ),
                      Expanded(
                          child: ListView.builder(
                              padding: const EdgeInsets.symmetric(vertical: 50),
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                return CustomDrawerItemsRow(
                                  drawerItemsModel: items[index],
                                  onPressed: () {
                                    // Navigator.pop(context);
                                    drawerNavigation(index, context);
                                  },
                                );
                              })),
                      const Divider(
                        color: Colors.black26,
                        height: 1,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: kTextTabBarHeight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Switch Account",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: TColor.secondaryText,
                                  fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Image.asset("assets/img/next.png",
                                  width: 18, height: 18),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: kToolbarHeight - 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Image.asset(
                              "assets/img/meun_close.png",
                              width: 25,
                              height: 25,
                            )),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }

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
}
