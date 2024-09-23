import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:musclemate/views/menu/menu_view.dart';
import 'package:musclemate/views/running/running_view.dart';
import 'package:musclemate/views/settings/setting_view.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class CheckProcessPage extends StatefulWidget {
  @override
  _CheckProcessPageState createState() => _CheckProcessPageState();
}

class _CheckProcessPageState extends State<CheckProcessPage> {
  File? _image;
  final TextEditingController _dateController = TextEditingController();
  int _selectedIndex = 0;

  // Method to pick an image from the gallery with permission handling
  Future<void> _pickImage() async {
    try {
      // Check if permission is permanently denied
      if (await Permission.photos.isPermanentlyDenied) {
        // Show dialog to direct user to app settings
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Permission Required'),
            content: Text('Please enable photo access in settings.'),
            actions: [
              TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await openAppSettings();
                },
                child: Text('Go to Settings'),
              ),
            ],
          ),
        );
        return;
      }

      // Request permission
      if (await Permission.photos.request().isGranted) {
        // Open gallery to select an image
        final pickedFile =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        setState(() {
          if (pickedFile != null) {
            _image = File(pickedFile.path); // Convert picked file to File
          }
        });
      } else {
        // Handle the case when the user denies the permission
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Permission denied to access photos')),
        );
      }
    } catch (e) {
      // Handle any exceptions that occur during the image picking process
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }

  // Handle bottom navigation item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the corresponding page
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MenuView()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RunningView()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingsView()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Your Process'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Display selected image or placeholder text
            _image == null ? Text('No image selected.') : Image.file(_image!),
            ElevatedButton(
              onPressed: _pickImage, // Call method to pick an image
              child: Text('Upload Image'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Enter the date you uploaded this image',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.date_range),
                ),
                keyboardType: TextInputType.datetime,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
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
    );
  }
}
