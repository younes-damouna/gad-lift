import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/common/input.widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:  Color(0xFFF3F1F1),
      body: Center( child:InputGroup())
      //  Center(
      //   child: Column(
      //     children: [
      //       // Center(child: Text('loginScreen')),
      //       Center(
      //       child:
      //      )
      //     ],
      //   ),
      // ),
    );
  }
}
