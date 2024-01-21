import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/app_bar.widget.dart';
import 'package:mobile_app/widgets/common/request_button.dart';
import 'package:mobile_app/widgets/common/section_title.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Settings'),
      backgroundColor: const Color(0xFFF3F1F1),
      body: Column(
        children: [
          Container(
            height: 500,
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
            child: ListView(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),

                  // color: const Color.fromARGB(22, 22, 22, 22),
                  //  color: const Color(0x63FFFFFF),
                  // height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SectionTitle(title: 'Requests', size: 18),
                        ],
                      ),
                     
                      RequestButton(
                        text: 'hello',
                        handlePress: () {},
                      ),
                      RequestButton(
                        text: 'hello',
                        handlePress: () {},
                      ),
                      RequestButton(
                        text: 'hello',
                        handlePress: () {},
                      ),
                      RequestButton(
                        text: 'hello',
                        handlePress: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: const Navigation(),
    );
  }
}
