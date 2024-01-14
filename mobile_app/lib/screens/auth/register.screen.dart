import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/common/input.widget.dart';
import 'package:mobile_app/widgets/common/primary_button.widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      
      children:[ Scaffold(
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
                      title: 'First Name',
                      secure: false,
                      icon: Icons.person_2_outlined,
                    ),
                    const InputGroup(
                      title: 'Last Name',
                      secure: false,
                      icon: Icons.person_2_outlined,
                    ),
                     const InputGroup(
                      title: 'Email',
                      secure: false,
                      icon: Icons.email,
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
                      text: 'Sign Up',
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
          ),
      ]
    );
  }
}
