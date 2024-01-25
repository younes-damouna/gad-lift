import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/api/services/auth.service.dart';
import 'package:mobile_app/screens/auth/login.screen.dart';
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
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  TextEditingController passwordNameController = TextEditingController();
  void handlePress(
    String email,
    String password,
    String firstName,
    String lastName,
  ) {

  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Sign Up',
      ),
      body: ListView(
        children: [
       
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),

              child: Form(
                child: Column(
                  key: _formKey,
                  children: [
                    Image.asset(
                      'assets/images/SignUp.png', fit: BoxFit.cover, width: 200,
                     
                    ),
                    InputGroup(
                      key: const Key('fname'),
                      controller: firstNameController,
                      title: 'First Name',
                      secure: false,
                      icon: Icons.person_2_outlined,
                    ),
                    InputGroup(
                      key: const Key('lname'),
                      controller: lastNameController,
                      title: 'Last Name',
                      secure: false,
                      icon: Icons.person_2_outlined,
                    ),
                    InputGroup(
                      key: const Key('email'),
                      controller: emailController,
                      title: 'Email',
                      secure: false,
                      icon: Icons.email,
                    ),
                    InputGroup(
                      key: const Key('password'),
                      controller: passwordNameController,
                      title: 'Password',
                      secure: true,
                      icon: Icons.remove_red_eye,
                    ),

                   
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.all(2),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.white,
                      ),
                      child: TextButton(
                        style: const ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            overlayColor:
                                MaterialStatePropertyAll(Colors.white60)),
                        onPressed: () {},
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/googleIcon.png'),
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: const Text(
                                    'Sign in with Google',
                                    style: TextStyle(color: Colors.black),
                                  ))
                            ]),
                      ),
                    ),

                    PrimaryButton(
                      key: const Key('register'),
                      text: 'Register',
                      color: Colors.white,
                      bgColor: const Color(0xFF2FE2EE),
                      handlePress: () async {
                        var t = emailController.text;
                        log('email $t');
                        await AuthService.register(
                          firstNameController.text,
                          lastNameController.text,
                          emailController.text,
                          passwordNameController.text,
                        );
                        // ignore: use_build_context_synchronously
                        Navigator.popAndPushNamed(context, '/login');
                      },
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
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const SectionTitle(
                            title: "Sign In", size: 12, color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        
        ],
      ),
    );
  }
}
