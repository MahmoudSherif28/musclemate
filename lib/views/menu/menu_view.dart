import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/helpers/menu_tap_fun.dart';
import 'package:musclemate/models/menu_cells_model.dart';
import 'package:musclemate/views/chatbot/chat.dart';
import 'package:musclemate/views/chatbot/chat_screen.dart';
import 'package:musclemate/views/settings/setting_view.dart';
import 'package:musclemate/views/weight/weight_view.dart';
import 'package:musclemate/widgets/custom_drawer.dart';
import 'package:musclemate/widgets/custom_menu_cell.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
        );
        break;
      case 1:
        Navigator.pushNamed(context, '/home');
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WeightView()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingsView()),
        );
        break;
    }
  }

  List<MenuCellsModel> menuArr = [
    MenuCellsModel(name: "Home", image: "assets/img/new/2.png", tag: "1"),
    MenuCellsModel(name: "Weight", image: "assets/img/new/3.png", tag: "2"),
    MenuCellsModel(
        name: "Traning plan", image: "assets/img/new/4.jpg", tag: "3"),
    // MenuCellsModel(
    //     name: "Training Status",
    //     image: "assets/img/menu_traning_status.png",
    //     tag: "4"),
    MenuCellsModel(name: "Meal Plan", image: "assets/img/new/5.png", tag: "5"),
    MenuCellsModel(name: "Schedule", image: "assets/img/new/6.jpg", tag: "6"),
    MenuCellsModel(name: "Running", image: "assets/img/new/7.png", tag: "7"),
    MenuCellsModel(name: "Exercises", image: "assets/img/new/8.jpeg", tag: "8"),
    MenuCellsModel(name: "Settings", image: "assets/img/new/9.jpg", tag: "9"),
    MenuCellsModel(name: "Support", image: "assets/img/new/10.jpg", tag: "10"),
  ];

  // Increase text size for all menu items
  final double menuItemTextSize = 18.0;

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
      body: Container(
        color: Colors.white,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: media.width * 1,
                collapsedHeight: kToolbarHeight + 20,
                flexibleSpace: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("assets/img/new/15.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: media.width,
                      height: media.width * 0.9,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.brown],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
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
                                      fontSize: 25,
                                      color: TColor.white,
                                      fontWeight: FontWeight.w700,
                                    )),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text("Profile",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: TColor.white,
                                      fontWeight: FontWeight.w500,
                                    ))
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
                childAspectRatio: 1.2),
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
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(media.width * 0.1),
            topRight: Radius.circular(media.width * 0.1),
          ),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center),
              label: 'Weight',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.transparent,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          elevation: 0,
        ),
      ),
    );
  }
}
