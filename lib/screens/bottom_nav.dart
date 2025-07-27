import 'package:flutter/material.dart';

import 'homescreen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  void setCurrentTabTo({required int newTabIndex}) {
    _currentIndex = newTabIndex;
    setState(() {});
  }

  Widget getViewForIndex(int index) {
    debugPrint(index.toString());
    switch (index) {
      case 0:
        return const Homescreen();
      case 1:
        return const Placeholder();
      case 2:
        return const Placeholder();
      default:
        return const Placeholder();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F4F2),
      body: getViewForIndex(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8,
        backgroundColor: Colors.white,
        useLegacyColorScheme: false,
        selectedLabelStyle: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        onTap: (newTab) {
          setCurrentTabTo(newTabIndex: newTab);
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horizontal_circle_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person_3_outlined), label: 'Recipients'),
        ],
      ),
    );
  }
}
