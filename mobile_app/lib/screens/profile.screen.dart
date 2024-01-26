import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/helpers/api/services/update_profile.service.dart';
import 'package:mobile_app/helpers/models/user.model.dart';
import 'package:mobile_app/helpers/providers/profile_provider.dart';
import 'package:mobile_app/helpers/validators/input.validator.dart';
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
  late String id;
  @override
  void initState() {
    final profileInfo = Provider.of<ProfileProvider>(context, listen: false);
    id = profileInfo.id;
    fullNameController = TextEditingController(
      text: "${profileInfo.firstName} ${profileInfo.lastName}",
    );
    emailController = TextEditingController(text: profileInfo.email);
    phoneController = TextEditingController(text: profileInfo.mobileNumber);

    super.initState();
  }

  XFile? pickedFile;
  getImage() async {
    final picker = ImagePicker();
    pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Profile',
      ),
      backgroundColor: const Color(0xFFF3F1F1),
      body: Consumer<ProfileProvider>(
        child: PrimaryButton(
          text: 'Save',
          color: Colors.white,
          bgColor: Colors.black,
          handlePress: () async {
            // print(_formKey.currentState!.validate());
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),
              );

              final fullName = fullNameController.text.trim().split(' ');
              final response = await UserService.updateUser(
                  fullName[0],
                  fullName[1],
                  emailController.text,
                  id,
                  pickedFile,
                  phoneController.text);

              final user = User.fromJson(response['user']);
              log('user: ${response['user']}');

              // ignore: use_build_context_synchronously
              Provider.of<ProfileProvider>(
                context,
                listen: false,
              ).getProfile(user);
            }
          },
        ),
        builder: (context, profile, child) {
          return ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () => getImage(),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  child: pickedFile == null
                      ? profile.profileIimg == ''
                          ? ClipOval(
                              child: Image.asset(
                              'assets/images/avatar.png',
                              width: 90,
                            ))
                          : ClipOval(
                              child: Image.network(
                              profile.profileIimg,
                              width: 90,
                            ))
                      : ClipOval(
                          child: Image.file(
                          File(pickedFile!.path),
                          height: 90,
                          width: 90,
                        )),
                ),
              ),
              Container(
                height: 490,
                decoration: const BoxDecoration(
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
                margin: const EdgeInsets.all(20),
                width: double.infinity,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                                handleValidation: Validator.validateFullName,
                                key: const Key('fname'),
                                controller: fullNameController,
                                title: 'Full Name',
                                secure: false,
                                icon: Icons.person_2_outlined,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                height: 0,
                              ),
                              InputGroup(
                                handleValidation: Validator.validateEmail,
                                key: const Key('email'),
                                controller: emailController,
                                title: 'Email',
                                secure: false,
                                icon: Icons.email_outlined,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                height: 0,
                              ),
                              InputGroup(
                                handleValidation: Validator.validatePhoneNumber,
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
                                    vertical: 10,
                                  ),
                                  child: child),
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
    );
  }
}
