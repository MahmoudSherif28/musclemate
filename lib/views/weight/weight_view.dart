import 'package:flutter/material.dart';
import 'package:musclemate/check_process.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/views/menu/menu_view.dart';
import 'package:musclemate/views/running/running_view.dart';
import 'package:musclemate/views/settings/setting_view.dart';
import 'package:musclemate/widgets/border_button.dart';

class WeightView extends StatefulWidget {
  const WeightView({super.key});

  @override
  State<WeightView> createState() => _WeightViewState();
}

class _WeightViewState extends State<WeightView> {
  String _weight = '';
  String _date = '';
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MenuView()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RunningView()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsView()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: TColor.kPrimaryColor,
          centerTitle: true,
          elevation: 0.1,
          title: Text(
            "Check your process",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: BorderButton(
                        title: "My Weight",
                        onPressed: () {
                          // Action for My Weight button
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: BorderButton(
                        title: "Check Process",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckProcessPage()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _weightController,
                      decoration: InputDecoration(
                        labelText: 'Weight',
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          _weight = value;
                        });
                      },
                    ),
                    SizedBox(height: 16), // Add some space between the fields
                    TextField(
                      controller: _dateController,
                      decoration: InputDecoration(
                        labelText: 'Date',
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      ),
                      keyboardType: TextInputType.datetime,
                      onChanged: (value) {
                        setState(() {
                          _date = value;
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Save button pressed
                      },
                      child: Text('Save'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.1),
              topRight:
                  Radius.circular(MediaQuery.of(context).size.width * 0.1),
            ),
            border: Border.all(color: Colors.brown),
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.directions_run),
                label: 'Running',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.brown,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
