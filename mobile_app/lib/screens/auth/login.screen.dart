
import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/api/services/auth.service.dart';
import 'package:mobile_app/helpers/models/user.model.dart';
import 'package:mobile_app/helpers/providers/profile_provider.dart';
import 'package:mobile_app/helpers/storage/secure.storage.dart';
import 'package:mobile_app/helpers/validators/input.validator.dart';
import 'package:mobile_app/screens/auth/register.screen.dart';
import 'package:mobile_app/screens/connect_device.screen.dart';
import 'package:mobile_app/widgets/app_bar.widget.dart';
import 'package:mobile_app/widgets/common/input.widget.dart';
import 'package:mobile_app/widgets/common/loading.widget.dart';
import 'package:mobile_app/widgets/common/primary_button.widget.dart';
import 'package:mobile_app/widgets/common/section_title.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                            handleValidation: Validator.validateEmail,
                          ),
                          InputGroup(
                            handleValidation: Validator.validatePassword,
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
                              onPressed: () async {
                                final res = await AuthService.googleSignIn();
                                if (res?['statusCode'] == 200) {
                                  final user = User.fromJson(res['user']);
                                  final storage = SecureStorage();
                                  await storage.saveToken(
                                      'access_token', res['access_token']);
                                  
                                  // ignore: use_build_context_synchronously
                                  Provider.of<ProfileProvider>(
                                    context,
                                    listen: false,
                                  ).getProfile(user);
                                  // ignore: use_build_context_synchronously
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) =>
                                        const Loading(
                                            color: Colors.green,
                                            text: "Success..."),
                                  );
                                  await Future.delayed(
                                      const Duration(seconds: 3));

                                  // ignore: use_build_context_synchronously
                                  Navigator.pop(context, '/login');
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ConnectDeviceScreen()));

                                } else if (res['statusCode'] == 400 ||
                                    res['statusCode'] == 401) {
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Oops! Google Sign-In didn’t work. Let’s try the regular registration instead.')),
                                  );
                                }
                              },
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
                            text: 'Log In',
                            color: Colors.white,
                            bgColor: const Color(0xFF2FE2EE),
                            handlePress: () async
                                //  async
                                {
                              // print(_formKey.currentState!.validate());
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar.
                                final response = await AuthService.login(
                                  emailController.text,
                                  passwordNameController.text,
                                );

                                if (response?['statusCode'] == 200) {
                                  final user = User.fromJson(response['user']);
                                  final storage = SecureStorage();
                                  await storage.saveToken(
                                      'access_token', response['access_token']);
                                  
                                  // ignore: use_build_context_synchronously
                                  Provider.of<ProfileProvider>(
                                    context,
                                    listen: false,
                                  ).getProfile(user);
                                  // ignore: use_build_context_synchronously
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) =>
                                        const Loading(
                                            color: Colors.green,
                                            text: "Success..."),
                                  );
                                  await Future.delayed(
                                      const Duration(seconds: 3));

                                  // ignore: use_build_context_synchronously
                                  Navigator.pop(context, '/login');
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ConnectDeviceScreen()));

                                } else if (response['statusCode'] == 400 ||
                                    response['statusCode'] == 401) {
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            '${response['statusMessage']}')),
                                  );
                                }
                              }
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
                                  title: "Register",
                                  size: 12,
                                  color: Colors.grey,
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
        ));
  }
}
