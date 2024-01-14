import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/common/input.widget.dart';
import 'package:mobile_app/widgets/common/primary_button.widget.dart';
// import 'package:mobile_app/widgets/common/secondary_button.widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF3F1F1),
        body: Center(
          child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),

              // height: 200,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Login.png', fit: BoxFit.cover,
                    // colorBlendMode: BlendMode.colorBurn,
                  ),
                  const InputGroup(
                    title: 'Email',
                    secure: false,
                    icon: Icons.person_2_outlined,
                  ),
                  const InputGroup(
                    title: 'Password',
                    secure: true,
                    icon: Icons.remove_red_eye,
                  ),
                  Image.asset(
                    'assets/images/googleButton.png', fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    // colorBlendMode: BlendMode.colorBurn,
                  ),
                  const PrimaryButton(
                    text: 'Log In',
                    color: Colors.white,
                    bgColor: Color(0xFF2FE2EE),
                  ),
                ],
              )),
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
