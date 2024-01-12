import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/widgets/navigation.widget.dart';

import 'widgets/app_bar.widget.dart';
// import 'package:mobile_app/widgets/app_bar.widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: const MyAppBar(),
        appBar: AppBar(
      // excludeHeaderSemantics: true,
      title: screenTitle(title: 'GadLift', size: 50),
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF2FE2EE),
      bottomOpacity: 0.5,
      toolbarHeight: 160,
      elevation: 5.0,
      leadingWidth: 40,
    
      // leadingWidth: 100,
      shadowColor: const Color(0xFF2FE2EE),
      // shape: const CircleBorder(
      //   side: BorderSide(width: 5, color: Colors.purple),
      // ),
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(1000))),
    ),
        backgroundColor: const Color(0xFFF3F1F1),
        body: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(0, 255, 193, 7)),
          child: const Center(
            child: Text(
              'Hello World!',
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  fontFamily: '',
                  backgroundColor: Color.fromARGB(255, 18, 163, 39)),
            ),
          ),
        ),
        bottomNavigationBar:const Navigation(),
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
