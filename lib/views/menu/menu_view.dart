import 'package:musclemate/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/helpers/confirm_dialog.dart';
import 'package:musclemate/helpers/loading_indicator_skeletonizer.dart';
import 'package:musclemate/helpers/menu_tap_fun.dart';
import 'package:musclemate/helpers/save_uid_in_sharedpreference.dart';
import 'package:musclemate/models/menu_cells_model.dart';
import 'package:musclemate/views/chatbot/chat_screen.dart';
import 'package:musclemate/views/home_view.dart';
import 'package:musclemate/views/profile/profileview.dart';
import 'package:musclemate/views/weight/weight_view.dart';
import 'package:musclemate/widgets/custom_menu_cell.dart';
import 'package:musclemate/widgets/when_error_widget.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});
  static String id = 'MenuView';

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  int _selectedIndex = 0;
  late CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  void _onItemTapped(int index, BuildContext context) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeView()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
        );
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
          MaterialPageRoute(builder: (context) => const ProfileView()),
        );
        break;
    }
  }

  List<MenuCellsModel> menuArr = [
    MenuCellsModel(name: "Home", image: "assets/img/new/2.png", tag: "1"),
    MenuCellsModel(name: "Weight", image: "assets/img/new/3.png", tag: "2"),
    MenuCellsModel(
        name: "Heart Rate", image: "assets/img/new/images_rate.jpeg", tag: "3"),
    MenuCellsModel(name: "Meal Plan", image: "assets/img/new/5.png", tag: "5"),
    MenuCellsModel(name: "Schedule", image: "assets/img/new/6.jpg", tag: "6"),
    MenuCellsModel(name: "Running", image: "assets/img/new/7.png", tag: "7"),
    MenuCellsModel(name: "Exercises", image: "assets/img/new/8.jpeg", tag: "8"),
    MenuCellsModel(name: "Settings", image: "assets/img/new/9.jpg", tag: "9"),
    MenuCellsModel(name: "Support", image: "assets/img/new/10.jpg", tag: "10"),
  ];

  final double menuItemTextSize = 18.0;

  var name;
  var userAge;
  String? _image;
  String? _userEmail;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return FutureBuilder<String?>(
        future: getUserUID(), // Fetch the stored UID
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SkeletonizerIndicator();
          }

          if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
            return ErrorMessageWidget(
                text:
                    'Error in fetching your data please try later , or try another login way.      ');
          }

          String? uid = snapshot.data;

          return StreamBuilder<DocumentSnapshot>(
            stream: users
                .doc(uid)
                .snapshots(), // Use UID to fetch the user's document
            builder: (context, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return SkeletonizerIndicator();
              }

              if (userSnapshot.hasError ||
                  !userSnapshot.hasData ||
                  !userSnapshot.data!.exists) {
                return ErrorMessageWidget(
                    text:
                        'Error in fetching your data please try later , or try another login way.      ');
              }

              var userDoc = userSnapshot.data!.data() as Map<String, dynamic>;
              name = userDoc['username'] ?? 'Name not available';
              userAge = userDoc['age'] ?? 'Age not available';
              _image = userDoc['imageUrl'] ?? 'Image not available';
              _userEmail = userDoc['email'] ?? 'Email not available';

              return Scaffold(
                body: Container(
                  color: Colors.white,
                  child: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        SliverAppBar(
                          automaticallyImplyLeading: false,
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
                                    image: AssetImage(
                                        "assets/img/new/images (4).jpeg.jpg"),
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
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ProfileView(),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 40),
                                  child: SingleChildScrollView(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 74,
                                          height: 74,
                                          decoration: BoxDecoration(
                                            color: TColor.white,
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          alignment: Alignment.center,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              child: CachedNetworkImage(
                                                imageUrl: _image!,
                                                width: 70,
                                                height: 70,
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                name,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: TColor.white,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                _userEmail!,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: TColor.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ];
                    },
                    body: GridView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 15),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: S.of(context).bhome,
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.chat),
                        label: S.of(context).bchat,
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.fitness_center),
                        label: S.of(context).bweight,
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: S.of(context).bsetting,
                      ),
                    ],
                    currentIndex: _selectedIndex,
                    selectedItemColor: Colors.amber[800],
                    unselectedItemColor: Colors.grey,
                    backgroundColor: Colors.transparent,
                    onTap: (index) {
                      _onItemTapped(index, context);
                    },
                    type: BottomNavigationBarType.fixed,
                    showUnselectedLabels: true,
                    elevation: 0,
                  ),
                ),
              );
            },
          );
        });
  }
}
