import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/api/services/family.service.dart';
import 'package:mobile_app/helpers/storage/secure.storage.dart';
import 'package:mobile_app/screens/join_family.screen.dart';
import 'package:mobile_app/screens/main_view.screen.dart';
import 'package:mobile_app/widgets/app_bar.widget.dart';
import 'package:mobile_app/widgets/common/input.widget.dart';
import 'package:mobile_app/widgets/common/primary_button.widget.dart';
import 'package:mobile_app/widgets/common/section_title.dart';

class CreateFamily extends StatefulWidget {
  const CreateFamily({super.key});

  @override
  State<CreateFamily> createState() => _CreateFamilyState();
}

class _CreateFamilyState extends State<CreateFamily> {
  @override
  Widget build(BuildContext context) {
    TextEditingController text = TextEditingController();

    return Scaffold(
      appBar: const MyAppBar(title: 'Create a Family'),
      backgroundColor: const Color(0xFFF3F1F1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: AlignmentDirectional.center,
            height: 300,
            margin: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              // color: Color.fromARGB(98, 255, 255, 255),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xf1f1f1f1),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                    child: Column(
                      children: [
                        InputGroup(
                          controller: text,
                          title: 'Floor Number',
                          secure: false,
                          icon: Icons.elevator_outlined,
                          color: Colors.black,
                        ),
                        PrimaryButton(
                            text: 'Create Family',
                            color: Colors.white,
                            bgColor: Colors.black,
                            handlePress:  () async
                                //  async
                                {
                                    final response =
                                  await FamilyService.createFamily(
                                text.text,
                              );
                                  // ignore: use_build_context_synchronously
                                  Navigator.popAndPushNamed(
                                      context,
                                     '/dashboard');
                              // print(_formKey.currentState!.validate());
                              // if (_formKey.currentState!.validate()) {
                                //  if (!context.mounted) return;
  // Navigator.pop(context); 
                              ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(
                                    content: Text(await response['message'])),
                              );
                              // ScaffoldMessenger.of(context).build((context)=>return Text('data'));
                              // If the form is valid, display a snackbar.
                              // }
                            
                              final storage = SecureStorage();

                              final token =
                                  await storage.getToken('access_token');
                              log('$response');
                            })
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SectionTitle(
                        title: 'Already have a Family?',
                        color: Colors.black,
                        size: 12,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                maintainState: false,
                                builder: (context) => const JoinFamilyScreen()),
                          );
                        },
                        child: const SectionTitle(
                          title: "Join Now", size: 12,
                          color: Colors.grey,
                          // style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
