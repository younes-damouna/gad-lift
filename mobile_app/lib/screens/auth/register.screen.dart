import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/api/services/auth.service.dart';
import 'package:mobile_app/helpers/validators/input.validator.dart';
import 'package:mobile_app/screens/auth/login.screen.dart';
import 'package:mobile_app/widgets/app_bar.widget.dart';
import 'package:mobile_app/widgets/common/input.widget.dart';
import 'package:mobile_app/widgets/common/loading.widget.dart';
import 'package:mobile_app/widgets/common/primary_button.widget.dart';
import 'package:mobile_app/widgets/common/section_title.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  TextEditingController passwordNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
                key: formKey,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/SignUp.png',
                      fit: BoxFit.cover,
                      width: 200,
                    ),
                    InputGroup(
                      handleValidation: Validator.validateName,
                      key: const Key('fname'),
                      controller: firstNameController,
                      title: 'First Name',
                      secure: false,
                      icon: Icons.person_2_outlined,
                    ),
                    InputGroup(
                      handleValidation: Validator.validateName,
                      key: const Key('lname'),
                      controller: lastNameController,
                      title: 'Last Name',
                      secure: false,
                      icon: Icons.person_2_outlined,
                    ),
                    InputGroup(
                      handleValidation: Validator.validateEmail,
                      key: const Key('email'),
                      controller: emailController,
                      title: 'Email',
                      secure: false,
                      icon: Icons.email,
                    ),
                    InputGroup(
                      handleValidation: Validator.validatePassword,
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
                        if (formKey.currentState!.validate()) {
                          final response = await AuthService.register(
                            firstNameController.text,
                            lastNameController.text,
                            emailController.text,
                            passwordNameController.text,
                          );
                          log('response ${response.runtimeType}');
                          if (response == 200) {
                            log('log200');
                            // ignore: use_build_context_synchronously
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) => const Loading(
                                  color: Colors.green, text: "Loading..."),
                            );

                            await Future.delayed(const Duration(seconds: 3));

                            // ignore: use_build_context_synchronously
                            Navigator.popAndPushNamed(context, '/login');
                          } else if (response == 400) {
                            log('inregister');
                            // ignore: use_build_context_synchronously
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) => const Loading(
                                  color: Colors.grey,
                                  text: "Error Try again later ..."),
                            );
                          }
                        }
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
                            title: "Sign In",
                            size: 12,
                            color: Colors.grey,
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
