import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/app_bar.widget.dart';
import 'package:mobile_app/widgets/common/input.widget.dart';
import 'package:mobile_app/widgets/common/section_title.dart';
import 'package:mobile_app/widgets/navigation.widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
    TextEditingController firstNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Profile',
        // avatar: CircleAvatar(
        //   child: Image.asset(
        //     'assets/images/AnimatedLogo1.png',
        //     // width: 300,

        //   ),
        // ),
      ),
      backgroundColor: const Color(0xFFF3F1F1),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          CircleAvatar(
            radius: 50,
            child: Image.asset(
              'assets/images/AnimatedLogo1.png',
              width: 90,
            ),
          ),
          Container(
            height: 450,
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
            // height: 300,
            margin: const EdgeInsets.all(20),
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),

              // color: const Color.fromARGB(22, 22, 22, 22),
              //  color: const Color(0x63FFFFFF),
              height: 200,
              child:  Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: SectionTitle(
                          title: 'Personal Information',
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   InputGroup(
                      key: const Key('fname'),
                      controller: firstNameController,
                      title: 'Younes Damouna',
                      secure: false,
                      icon: Icons.person_2_outlined,
                    ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: const Navigation(),
    );
  }
}
