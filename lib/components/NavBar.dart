import 'package:capstonec/screen/Camera/CameraScreen.dart';
import 'package:capstonec/screen/myplants/myplants.dart';
import 'package:flutter/material.dart';
import 'package:capstonec/screen/HomePage.dart';
import 'package:capstonec/screen/Profile/Profile.dart';

class Navbar extends StatefulWidget {
  final int index;

  const Navbar({Key? key, required this.index}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
  }

  List<Widget> Menupage = [
    HomePage(),
    CameraScreen(),
    Profile(),
    MyPlants()
  ];

  List<BottomNavigationBarItem> IconMenu = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.camera_alt),
      label: 'Camera',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Menupage[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: IconMenu,
        ),
      ),
    );
  }
}