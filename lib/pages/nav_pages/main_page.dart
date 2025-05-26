import 'package:flutter/material.dart';
import 'package:mansau_sabah/pages/nav_pages/card_district.dart';
//import 'package:flutter/cupertino.dart';
import 'package:mansau_sabah/pages/nav_pages/itinerary_page.dart';
import 'package:mansau_sabah/pages/nav_pages/map_page.dart';
import 'package:mansau_sabah/pages/nav_pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    CardDistrict(),
    ItineraryPage(),
    MapPage(),
    ProfilePage(),
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedFontSize: 10,
        selectedFontSize: 10,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.teal.shade900,
        // ignore: deprecated_member_use
        unselectedItemColor: Colors.grey.withOpacity(0.6),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              label: ('Districts'), icon: Icon(Icons.home_filled)),
          BottomNavigationBarItem(
              label: ('Itinerary'), icon: Icon(Icons.event_note_rounded)),
          BottomNavigationBarItem(
              label: ('Map'), icon: Icon(Icons.explore_outlined)),
          BottomNavigationBarItem(
              label: ('Log Out'), icon: Icon(Icons.logout_outlined)),
        ],
      ),
    );
  }
}
