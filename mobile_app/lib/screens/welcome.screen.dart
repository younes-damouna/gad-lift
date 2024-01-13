import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor: const Color(0xFFF3F1F1),

        body: Center(
      child: Image.asset('assets/images/AnimatedLogo.png'),

      // Image(
      //   image: NetworkImage(
      //       'https://raw.githubusercontent.com/younes-damouna/younes-damouna/main/github-banner.png'),
      // ),
    ));
  }
}
