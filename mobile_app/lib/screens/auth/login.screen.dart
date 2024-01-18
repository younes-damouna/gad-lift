import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/api/services/auth.service.dart';
import 'package:mobile_app/helpers/models/user.model.dart';
import 'package:mobile_app/screens/auth/register.screen.dart';
import 'package:mobile_app/widgets/app_bar.widget.dart';
import 'package:mobile_app/widgets/common/input.widget.dart';
import 'package:mobile_app/widgets/common/primary_button.widget.dart';
import 'package:mobile_app/widgets/common/section_title.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  validate(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(title: 'Log In'),
        backgroundColor: const Color(0xFFF3F1F1),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),

            // height: 200,
            child: ListView(
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/Login.png', fit: BoxFit.cover, width: 300,
                      // colorBlendMode: BlendMode.colorBurn,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          InputGroup(
                            controller: emailController,
                            title: 'Email',
                            secure: false,
                            icon: Icons.person_2_outlined,
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
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero),
                                ),
                                overlayColor:
                                    MaterialStatePropertyAll(Colors.white60)),
                            onPressed: () {},
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
                          PrimaryButton(
                            text: 'Log In',
                            color: Colors.white,
                            bgColor: const Color(0xFF2FE2EE),
                            handlePress: () async
                                //  async
                                {
                              // print(_formKey.currentState!.validate());
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                                // If the form is valid, display a snackbar. 
                                
                              }
                               final response = await AuthService.login(
                                  emailController.text,
                                  passwordNameController.text,

                                );
                                final user=User.fromJson(response['user']);

                                log('user: $user');
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SectionTitle(
                                title: 'Don\'t Have an Account?',
                                color: Colors.black,
                                size: 12,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          maintainState: false,
                                          builder: (context) =>
                                              const RegisterScreen()));
                                },
                                child: const SectionTitle(
                                  title: "Register", size: 12,
                                  color: Colors.grey,
                                  // style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
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
