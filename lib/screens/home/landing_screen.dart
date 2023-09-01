import 'package:attendenceapp/screens/home/Profile.dart';
import 'package:attendenceapp/screens/home/all_students.dart';
import 'package:attendenceapp/screens/home/home.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  var listOfScreens = [
    const HomeScreen(),
    const AllStudents(),
    const Profile(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listOfScreens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Students',
              icon: Icon(Icons.person_2_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person),
            ),
          ]),
    );
  }
}
