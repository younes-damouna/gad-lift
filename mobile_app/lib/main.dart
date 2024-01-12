import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/widgets/navigation.widget.dart';
import 'package:mobile_app/widgets/appBar.widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const MyAppBar(),
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
