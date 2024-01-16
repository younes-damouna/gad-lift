import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/screens/auth/login.screen.dart';
import 'package:mobile_app/screens/auth/register.screen.dart';
import 'package:mobile_app/screens/connect_device.screen.dart';
import 'package:mobile_app/screens/dashboard.screen.dart';
import 'package:mobile_app/screens/profile.screen.dart';
import 'package:mobile_app/screens/settings.screen.dart';
import 'package:mobile_app/screens/test_validation.screen.dart';
import 'package:mobile_app/screens/welcome.screen.dart';
import 'package:mobile_app/widgets/navigation.widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
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
    setState(() {
      _page = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 1000), curve: Curves.easeInOutCubicEmphasized);
    });
  }

  @override
  void initState() {
    // _pageController = PageController(initialPage: _page,keepPage: true);
    super.initState();
  }

//  void _onItemTapped(int index) {
//     setState(() {
//       _page = index;
//        _pageController = PageController(initialPage: _page);
//     });
//  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple)
      // ),
      // theme: ThemeData(
      //  textTheme: GoogleFonts.zenDotsTextTheme(
      //    Theme.of(context).textTheme,
      //  ),
      //  ),

      // home: RegisterScreen()
      home:
          // DashboardScreen(),
          // home: WelcomeScreen(),
          // home: ProfileScreen(),
          // home: ConnectDeviceScreen(),
          // routes: Map('/'),
          Scaffold(
        //   // appBar: const MyAppBar(),
        //   appBar: MyAppBar(key: key,),
        //   // AppBar(
        //   //   // scrolledUnderElevation: 1,

        //   //   // excludeHeaderSemantics: true,
        //   //   title: Column(
        //   //     children: [
        //   //       screenTitle(title: 'GadLift', size: 50),
        //   //     screenTitle(title: 'Lift Your Gadgets With Us', size: 10),],
        //   //   ),
        //   //   bottom:  const PreferredSize(
        //   //     preferredSize: Size(100, 100),
        //   //     child: Text(''),
        //   //     // child: Text(
        //   //     //   'hello',
        //   //     // )
        //   //   ),
        //   //   // foregroundColor: Colors.white,
        //   //   backgroundColor: const Color(0xFF2FE2EE),
        //   //   bottomOpacity: 0.5,
        //   //   // toolbarHeight: 140,

        //   //   toolbarHeight: 80,
        //   //   elevation: 5.0,
        //   //   leadingWidth: 40,
        //   //   titleTextStyle:  const TextStyle(
        //   //     color: Colors.white,
        //   //   ),

        //   //   // leadingWidth: 100,
        //   //   shadowColor:  const Color(0xFF2FE2EE),
        //   //   // shape: const CircleBorder(
        //   //   //   side: BorderSide(width: 5, color: Colors.purple),
        //   //   // ),
        //   //   shape: const RoundedRectangleBorder(

        //   //       borderRadius:
        //   //           BorderRadius.vertical(bottom: Radius.circular(1000))),
        //   // ),
        //   backgroundColor:  const Color(0xFFF3F1F1),
        body: PageView(
          // pageSnapping: true,
          // physics: const ScrollPhysics(),
          scrollBehavior: const ScrollBehavior(),

          controller: _pageController,
          // allowImplicitScrolling: true,
          // scrollBehavior: const MaterialScrollBehavior(),
          onPageChanged: (newPage) {
            pageChanged(newPage);
            setState(() {
              //           _page = newPage;
              //           //  _pageController = PageController(initialPage: newPage);
              // _pageController.animateToPage(newPage, duration: const Duration(milliseconds: 500), curve: Curves.ease);

              // print(_page);
            });
          },
          children: const [
            // WelcomeScreen(),
            // RegisterScreen(),
            // LoginScreen(),
            ProfileScreen(),
            DashboardScreen(),
            SettingsScreen(),
            // ConnectDeviceScreen(),
            // MyCustomForm()
          ],
        ),
        //   body:  const LoginScreen(),
        //   // body: WelcomeScreen(key: key),
        //   // body: DashboardScreen(key: key),
        //   // body: Container(
        //   //   height: 100,
        //   //   margin: const EdgeInsets.all(20),
        //   //   padding: const EdgeInsets.all(20),

        //   //   decoration:
        //   //       const BoxDecoration(color: Color.fromARGB(255, 255, 193, 7)),
        //   //       // child: Container(
        //   //       //   color: Colors.red,
        //   //       // ),

        //   //   // child: const Center(
        //   //   //   // child: Text(
        //   //   //   //   'Hello World!',

        //   //   //   //   style: TextStyle(
        //   //   //   //       color: Colors.white70,
        //   //   //   //       fontSize: 30,
        //   //   //   //       fontWeight: FontWeight.w800,
        //   //   //   //       fontFamily: '',
        //   //   //   //       backgroundColor: Color.fromARGB(255, 18, 163, 39)),
        //   //   //   // ),
        //   //   //   // child: TextButton(
        //   //   //   //     child: Text('data'),
        //   //   //   //   onPressed: () {
        //   //   //   //     Navigator.push(
        //   //   //   //       context, MaterialPageRoute(builder: (context)=>const SettingsScreen()));
        //   //   //   //   },

        //   //   //   // ),
        // child: _widgetOptions.elementAt(_selectedIndex),
        //   //   //   // child: ,
        //   //   // ),
        //   // ),
        // bottomNavigationBar: const Navigation(),
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
                // backgroundColor: Colors.red,
                tooltip: 'Settings Screen'),
          ],
          // enableFeedback: true,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          currentIndex: _page,

          type: BottomNavigationBarType.fixed,
          enableFeedback: true,

          onTap: (index) {
            bottomTapped(index);
            setState(() {
              _page = index;

              // _pageController = PageController(initialPage: index);
              //   log('${ _pageController.initialPage}');
            });
          },
          selectedFontSize: 15,

          selectedLabelStyle: GoogleFonts.zenDots(
            fontWeight: FontWeight.w900,
            fontSize: 16,
          ),
          unselectedLabelStyle: GoogleFonts.zenDots(),
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
        ),
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
        // fontWeight: FontWeight.w900,
      ),
    ),
  );
}
