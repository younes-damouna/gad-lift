import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Navigation extends StatefulWidget {
  const Navigation({
    super.key,
  });

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 1;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Profile',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: Settings',
  //     style: optionStyle,
  //   ),
  // ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: const Color(0xFF2FE2EE),

      unselectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person_outlined),
            tooltip: 'Profile Screen'),
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home_outlined),
          tooltip: 'Home Screen',
        ),
        BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.settings_outlined),
            // backgroundColor: Colors.red,
            tooltip: 'Settings Screen'),
      ],
      // enableFeedback: true,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      enableFeedback: true,
      onTap: _onItemTapped,
      selectedFontSize: 15,

      selectedLabelStyle: GoogleFonts.zenDots(
        fontWeight: FontWeight.w900,
        fontSize: 16,
      ),
        unselectedLabelStyle: GoogleFonts.zenDots(
       
      ),
      // const TextStyle(
      // fontWeight: FontWeight.w900,
      // fontFamily: 'zenDots',
      // package: 'google_fonts',
      // fontSize: 20,
      // shadows: [
      //   // Shadow(
      //   //   color: Colors.white,
      //   //   offset: Offset(1, 1),
      //   //   blurRadius: 10,
      //   // ),
      // ]),
      iconSize: 30,

      // selectedIconTheme: const IconThemeData(color: Colors.amber),
    );
  }
}
