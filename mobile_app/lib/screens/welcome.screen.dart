import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F1F1),
      body: Column(
        children: [
          Expanded(
              child: Container(
                  child: Image.asset('assets/images/AnimatedLogo.png'))),

          // Image(
          //   image: NetworkImage(
          //       'https://raw.githubusercontent.com/younes-damouna/younes-damouna/main/github-banner.png'),
          // ),

          // Container(
          //     // height: 50,
          //     // color: Colors.red,
          //     child: PhysicalShape(
          //     clipper: const ShapeBorderClipper(
          //     shape: CircleBorder(eccentricity: .5, side: BorderSide.none
          //         // borderRadius: BorderRadius.vertical(
          //         //   top: Radius.circular(1000),
          //         // ),
          //         ),
          //   ),
          //   color: const Color(0xFF2FE2EE),
          //   elevation: 5,
          //   shadowColor: const Color(0xFF2FE2EE),
          //   child: Container(height: 500),
          // ))
          Container(
            height: 100,
            decoration: const BoxDecoration(
                color: Color(0xFF2FE2EE),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(1000),
                    topRight: Radius.circular(1000))),
          )
        ],
      ),

      // bottomNavigationBar: BottomNavigationBar(

      //   backgroundColor: const Color(0xFFF3F1F1),

      //   items: const [
      //       BottomNavigationBarItem(icon: Icon(Icons.alarm,color: Colors.transparent,), label: ''),
      //       BottomNavigationBarItem(icon: Icon(Icons.alarm,color: Colors.transparent,), label: '')
      //   ],

      // ),
    );
  }
}
