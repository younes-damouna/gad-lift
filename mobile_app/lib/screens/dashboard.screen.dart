import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/app_bar.widget.dart';
import 'package:mobile_app/widgets/camera_view.widget.dart';
import 'package:mobile_app/widgets/common/section_title.dart';
import 'package:mobile_app/widgets/common/secondary_button.widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Dashboard'),
      backgroundColor: const Color(0xFFF3F1F1),
      body: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 20),
            height: 50,
            // color: const Color(0xFF2FE2EE),
            decoration: BoxDecoration(
                // image: DecorationImage(
                //   image: NetworkImage(
                //       'https://media.geeksforgeeks.org/wp-content/cdn-uploads/logo.png'),
                // ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                    color: const Color(0xFF2FE2EE),
                    strokeAlign: BorderSide.strokeAlignInside,
                    width: 2,
                    style: BorderStyle.solid),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  )
                ]),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SectionTitle(
                        title: 'Device Status',
                        size: 15,
                        color: Colors.black,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.green,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const CameraView(),
          const Row(
            children: [
              SecondaryButton(
                text: 'Up',
                icon: Icons.keyboard_double_arrow_up,
              ),
              SecondaryButton(
                text: 'Down',
                icon: Icons.keyboard_double_arrow_down,
              ),
            ],
          )
        ],
      ),
    );
  }
}
