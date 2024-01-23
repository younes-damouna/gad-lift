import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/screens/create_family.screen.dart';
import 'package:mobile_app/screens/dashboard.screen.dart';
import 'package:mobile_app/screens/join_family.screen.dart';
import 'package:mobile_app/screens/profile.screen.dart';
import 'package:mobile_app/screens/settings.screen.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _page = 1;
  final PageController _pageController = PageController(
    initialPage: 1,
    keepPage: true,
  );

  void pageChanged(int index) {
    setState(() {
      _page = index;
    });
  }

  void bottomTapped(int index) {
    setState(
      () {
        _page = index;
        _pageController.animateToPage(index,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOutCubicEmphasized);
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          // routes: Map('/'),

          body: PageView(
            // scrollBehavior: const ScrollBehavior(),

            controller: _pageController,
            scrollBehavior: const MaterialScrollBehavior(),
            onPageChanged: (newPage) {
              pageChanged(newPage);
            },
            children: const [
             
              ProfileScreen(
                key: Key('profile'),
              ),
              DashboardScreen(key: Key('dashboard'),),
             
             
              SettingsScreen(
                key: Key('settings'),
              ),
            ],
          ),

          //context, MaterialPageRoute(builder: (context)=>const SettingsScreen()));

          //bottomNavigationBar: const Navigation(),
          bottomNavigationBar: BottomNavigationBar(
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
                tooltip: 'Settings Screen',
              ),
             
            ],

            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            currentIndex: _page,

            type: BottomNavigationBarType.fixed,
            enableFeedback: true,

            onTap: (index) {
              bottomTapped(index);
            },
            selectedFontSize: 15,

            selectedLabelStyle: GoogleFonts.zenDots(
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
            unselectedLabelStyle: GoogleFonts.zenDots(),

            iconSize: 30,

            // selectedIconTheme: const IconThemeData(color: Colors.amber),
          ),
        
      );
  }
}

Widget screenTitle({required String title, required double size}) {
  return Center(
    child: Text(
      title,
      style: GoogleFonts.zenDots(
        fontSize: size,
      ),
    ),
  );
}
