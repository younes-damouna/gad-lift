import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/api/services/family.service.dart';
import 'package:mobile_app/screens/create_family.screen.dart';
import 'package:mobile_app/widgets/app_bar.widget.dart';
import 'package:mobile_app/widgets/common/input.widget.dart';
import 'package:mobile_app/widgets/common/primary_button.widget.dart';
import 'package:mobile_app/widgets/common/section_title.dart';

class JoinFamilyScreen extends StatefulWidget {
  const JoinFamilyScreen({super.key});

  @override
  State<JoinFamilyScreen> createState() => _JoinFamilyScreenState();
}

class _JoinFamilyScreenState extends State<JoinFamilyScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController code = TextEditingController();

    return Scaffold(
      appBar: const MyAppBar(title: 'Join a Family'),
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
                  const SectionTitle(title: '6 Digits Code', size: 14),
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                    child: Column(
                      children: [
                        InputGroup(
                          controller: code,
                          title: 'Family Code',
                          secure: false,
                          icon: Icons.wifi,
                          color: Colors.black,
                        ),
                        PrimaryButton(
                            text: 'Join Family',
                            color: Colors.white,
                            bgColor: Colors.black,
                            handlePress: () async {
                              final checkParent =
                                  await FamilyService.checkIfParent();
                              log('$checkParent');
                              if (checkParent['exists']) {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'Your family code is: ${checkParent['family_code']}')),
                                );
                              } else {
                                final response =
                                    await FamilyService.requestJoinFamily(
                                  code.text,
                                );
                                // if (!context.mounted) return;
                                if (response == 200 || response == 201) {
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Request Sent Successfully!')),
                                  );
                                }
                              }

                              // ignore: use_build_context_synchronously
                              Navigator.popAndPushNamed(context, '/dashboard');
                            })
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SectionTitle(
                        title: 'Don\'t have a Family?',
                        color: Colors.black,
                        size: 12,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              maintainState: false,
                              builder: (context) => const CreateFamily(),
                            ),
                          );
                        },
                        child: const SectionTitle(
                          title: "Create Now",
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
        ],
      ),
    );
  }
}
