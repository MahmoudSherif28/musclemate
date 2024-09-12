import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/helpers/menu_tap_fun.dart';
import 'package:musclemate/models/menu_cells_model.dart';
import 'package:musclemate/widgets/custom_drawer.dart';
import 'package:musclemate/widgets/custom_menu_cell.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  List<MenuCellsModel> menuArr = [
    MenuCellsModel(name: "Home", image: "assets/img/menu_home.png", tag: "1"),
    MenuCellsModel(
        name: "Weight", image: "assets/img/menu_weight.png", tag: "2"),
    MenuCellsModel(
        name: "Traning plan",
        image: "assets/img/menu_traning_plan.png",
        tag: "3"),
    // MenuCellsModel(
    //     name: "Training Status",
    //     image: "assets/img/menu_traning_status.png",
    //     tag: "4"),
    MenuCellsModel(
        name: "Meal Plan", image: "assets/img/menu_meal_plan.png", tag: "5"),
    MenuCellsModel(
        name: "Schedule", image: "assets/img/menu_schedule.png", tag: "6"),
    MenuCellsModel(
        name: "Running", image: "assets/img/menu_running.png", tag: "7"),
    MenuCellsModel(
        name: "Exercises", image: "assets/img/menu_exercises.png", tag: "8"),
    MenuCellsModel(
        name: "Settings", image: "assets/img/menu_settings.png", tag: "9"),
    MenuCellsModel(
        name: "Support", image: "assets/img/menu_support.png", tag: "10"),
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      drawer: CustomDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: media.width * 0.6,
              collapsedHeight: kToolbarHeight + 20,
              flexibleSpace: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.asset(
                    "assets/img/1.png",
                    width: media.width,
                    height: media.width * 0.8,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: media.width,
                    height: media.width * 0.8,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.transparent, Colors.black],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 30),
                    child: Row(
                      children: [
                        Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                              color: TColor.white,
                              borderRadius: BorderRadius.circular(27)),
                          alignment: Alignment.center,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset(
                                "assets/img/u1.png",
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Code For Any",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: TColor.white,
                                      fontWeight: FontWeight.w700)),
                              const SizedBox(
                                height: 4,
                              ),
                              Text("Profile",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: TColor.white,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ];
        },
        body: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1),
          itemCount: menuArr.length,
          itemBuilder: ((context, index) {
            return CustomMenuCell(
              menuCellsModel: menuArr[index],
              onPressed: () {
                menuTapMethod(menuArr[index].tag, context);
              },
            );
          }),
        ),
      ),
    );
  }
}
