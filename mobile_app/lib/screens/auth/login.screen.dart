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
    return  Scaffold(
      backgroundColor:  const Color(0xFFF3F1F1),
      body:  Center(
        child: Container(
          // height: 100,
          child:const Column(children: [
          InputGroup(title: 'Email'),
            InputGroup(title: 'Password')
        ],)
        ),
      )
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
