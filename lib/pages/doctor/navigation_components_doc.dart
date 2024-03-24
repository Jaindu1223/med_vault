import 'package:flutter/material.dart';

class NavigationService {
  static Future<dynamic> navigateTo(Widget page, BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: BottomNavigationBar(
        //backgroundColor: Colors.lightBlue, // Set background color here
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blueAccent,// Set icon color here
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital_sharp),
            label: 'Pharmacy Finder',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'My QR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: currentIndex,
        selectedFontSize: 14, // Adjust the font size for the selected icon
        unselectedFontSize: 12,

        // selectedItemColor: Colors.blueAccent,
        onTap: onTap,
      ),
    );
  }
}