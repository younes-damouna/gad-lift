import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/helpers/api/services/family.service.dart';
import 'package:mobile_app/helpers/validators/input.validator.dart';
import 'package:mobile_app/widgets/app_bar.widget.dart';
import 'package:mobile_app/widgets/common/input.widget.dart';
import 'package:mobile_app/widgets/common/primary_button.widget.dart';


class ConnectDeviceScreen extends StatelessWidget {
  const ConnectDeviceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController text = TextEditingController();

    return Scaffold(
      appBar: const MyAppBar(title: 'Connect Device'),
      backgroundColor: const Color(0xFFF3F1F1),
      body: Container(
        height: double.infinity,
        margin: const EdgeInsets.all(0),
        // decoration: BoxDecoration(color: Colors.amber),
        child: Stack(
            // fit: StackFit.expand,
            // clipBehavior: Clip.hardEdge,
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Positioned(
                top: -50,
                left: 10,
                right: 10,
                child: SvgPicture.asset('assets/images/wifi.svg'),
              ),
              Positioned(
                // height: double.infinity,
                bottom: -150,
                // top: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: const Color.fromARGB(0, 255, 255, 255),
                  // width: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/foreground.svg',
                        alignment: Alignment.bottomRight,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // width: double.maxFinite,
                // top: 300,
                left: 10,
                right: 10,
                // bottom: 100,
                // bottom: 50,
                child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        InputGroup(
                                                          handleValidation: Validator.validateIP,

                          controller: text,
                          title: 'Ip Address',
                          secure: false,
                          icon: Icons.wifi,
                          color: Colors.black,
                        ),
                        PrimaryButton(
                            text: 'Connect Device',
                            color: Colors.white,
                            bgColor: Colors.black,
                            handlePress: () async{
                            

                              Navigator.popAndPushNamed(context, '/create-family');
                            })
                      ],
                    )),
              )
            ]),
      ),
//  resizeToAvoidBottomInset: false,
      // bottomNavigationBar: Navigation(),
    );
  }
}
