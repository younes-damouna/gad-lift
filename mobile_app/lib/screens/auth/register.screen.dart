import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/app_bar.widget.dart';
import 'package:mobile_app/widgets/common/input.widget.dart';
import 'package:mobile_app/widgets/common/primary_button.widget.dart';
import 'package:mobile_app/widgets/common/section_title.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailCoontroller = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  TextEditingController passwordNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Sign Up',
      ),
      body: ListView(children: [
        //  Scaffold(
        // backgroundColor: const Color(0xFFF3F1F1),
        // body:
        Center(
          child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),

              // height: 200,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/SignUp.png', fit: BoxFit.cover,
                    // colorBlendMode: BlendMode.colorBurn,
                  ),
                  InputGroup(
                    controller: firstNameController,
                    title: 'First Name',
                    secure: false,
                    icon: Icons.person_2_outlined,
                  ),
                  InputGroup(
                    controller: lastNameController,
                    title: 'Last Name',
                    secure: false,
                    icon: Icons.person_2_outlined,
                  ),
                  InputGroup(
                    controller: emailCoontroller,
                    title: 'Email',
                    secure: false,
                    icon: Icons.email,
                  ),
                  InputGroup(
                    controller: passwordNameController,
                    title: 'Password',
                    secure: true,
                    icon: Icons.remove_red_eye,
                  ),

                  // Image.asset(
                  //   'assets/images/googleButton.png', fit: BoxFit.cover,
                  //   width: MediaQuery.of(context).size.width,
                  //   // colorBlendMode: BlendMode.colorBurn,
                  // ),
                  TextButton(
                    style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                      ),
                      overlayColor: MaterialStatePropertyAll(Colors.white60),
                    ),
                    onPressed: () {
                   
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/googleIcon.png'),
                            const Text('Sign in with Google')
                          ]),
                    ),
                  ),

                  const PrimaryButton(
                    text: 'Register',
                    color: Colors.white,
                    bgColor: Color(0xFF2FE2EE),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SectionTitle(
                        title: 'Already Have an Account?',
                        color: Colors.black,
                        size: 12,
                      ),
                      TextButton(
                          onPressed: () {
                               log('emailCoontroller.text');
                          },
                          child: const SectionTitle(
                            title: "Sign In", size: 12, color: Colors.grey,
                            // style: TextStyle(color: Colors.grey),
                          )),
                    ],
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
        // ),
      ]),
    );
  }
}
