import 'package:flutter/material.dart';
class Navigation extends StatefulWidget {
  const Navigation({
    super.key,
  });

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: const Color(0xFF2FE2EE),
      unselectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(Icons.person_outlined),
        ),
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home_outlined),
        ),
        BottomNavigationBarItem(
          label: 'Settings',
          icon: Icon(Icons.settings_outlined),
        ),
      ],
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
    );
  }
}
