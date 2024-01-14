import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/screens/auth/login.screen.dart';
import 'package:mobile_app/screens/auth/register.screen.dart';
import 'package:mobile_app/screens/connect_device.screen.dart';
import 'package:mobile_app/screens/dashboard.screen.dart';
import 'package:mobile_app/screens/profile.screen.dart';
import 'package:mobile_app/screens/welcome.screen.dart';
import 'package:mobile_app/widgets/app_bar.widget.dart';
// import 'package:mobile_app/screens/settings.screen.dart';
import 'package:mobile_app/widgets/navigation.widget.dart';

// import 'widgets/app_bar.widget.dart';
// import 'package:mobile_app/widgets/app_bar.widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple)
      // ),

      // home: RegisterScreen()
      // home: DashboardScreen(),
      // home: WelcomeScreen(),
      // home: ProfileScreen(),
      home: ConnectDeviceScreen(),
      // routes: Map('/'),
      // Scaffold(
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
      //   // body: const RegisterScreen(),
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
      //   //   //           // child: _widgetOptions.elementAt(_selectedIndex),
      //   //   //   // child: ,
      //   //   // ),
      //   // ),
      //   // bottomNavigationBar: const Navigation(),
      // ),
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
