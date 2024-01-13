import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Image(image: AssetImage('animatedLogo.png'))
      // Image(
      //   image: NetworkImage(
      //       'https://raw.githubusercontent.com/younes-damouna/younes-damouna/main/github-banner.png'),
      // ),
    ));
  }
}
