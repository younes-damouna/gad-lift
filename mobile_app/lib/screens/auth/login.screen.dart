import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/app_bar.widget.dart';
import 'package:mobile_app/widgets/common/input.widget.dart';
import 'package:mobile_app/widgets/common/primary_button.widget.dart';
import 'package:mobile_app/widgets/common/section_title.dart';
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
      appBar: const MyAppBar(title: 'Log In'),
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
                      )),
                  const PrimaryButton(
                    text: 'Log In',
                    color: Colors.white,
                    bgColor: Color(0xFF2FE2EE),
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
                        onPressed: () {},
                        child: const SectionTitle(
                          title: "Register", size: 12, color: Colors.grey,
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
        );
  }
}
