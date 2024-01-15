import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_app/screens/auth/login.screen.dart';
import 'package:mobile_app/widgets/app_bar.widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late final Timer timer;
  final values = [
    'assets/images/AnimatedLogo1.png',
    'assets/images/AnimatedLogo2.png',
    'assets/images/AnimatedLogo3.png',
    'assets/images/AnimatedLogo4.png',
  ];
  int _index = 0;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() => _index++);
    });
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext(context)=>const LoginScreen())));
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: ''),
      backgroundColor: const Color(0xFFF3F1F1),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 100,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                child: Image.asset(
                  values[_index % values.length],
                  key: UniqueKey(),
                ),
              ),
            ),
          ),

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
