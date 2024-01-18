
import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/providers/profile_provider.dart';
import 'package:mobile_app/widgets/app_bar.widget.dart';
import 'package:mobile_app/widgets/common/input.widget.dart';
import 'package:mobile_app/widgets/common/primary_button.widget.dart';
import 'package:mobile_app/widgets/common/section_title.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController fullNameController;
  late TextEditingController emailController;

  late TextEditingController phoneController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final profileInfo = Provider.of<ProfileProvider>(context, listen: false);

    fullNameController = TextEditingController(
        text: "${profileInfo.firstName} ${profileInfo.lastName}");
    emailController = TextEditingController(text: profileInfo.email);
    phoneController = TextEditingController();
    // fullNameController = TextEditingController();
    // emailController = TextEditingController();
    // log('$user');
    super.initState();
  }

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
      body: Consumer<ProfileProvider>(
        builder: (context, profile, child) {
          return ListView(
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),

                  // color: const Color.fromARGB(22, 22, 22, 22),
                  //  color: const Color(0x63FFFFFF),
                  height: 200,
                  child: Column(
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
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              InputGroup(
                                key: const Key('fname'),
                                controller: fullNameController,
                                title: 'Full Name',
                                secure: false,
                                icon: Icons.person_2_outlined,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InputGroup(
                                key: const Key('email'),
                                controller: emailController,
                                title: 'Email',
                                secure: false,
                                icon: Icons.email_outlined,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InputGroup(
                                key: const Key('mobile'),
                                controller: phoneController,
                                title: 'Mobile Number',
                                secure: false,
                                icon: Icons.phone_android_outlined,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 15,
                                ),
                                child: PrimaryButton(
                                  text: 'Save',
                                  color: Colors.white,
                                  bgColor: Colors.black,
                                  handlePress: () {},
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      // bottomNavigationBar: const Navigation(),
    );
  }
}
