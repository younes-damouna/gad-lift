import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/api/services/control.service.dart';
import 'package:mobile_app/widgets/app_bar.widget.dart';
import 'package:mobile_app/widgets/camera_view.widget.dart';
import 'package:mobile_app/widgets/common/custom_text_button.widget.dart';
import 'package:mobile_app/widgets/common/section_title.dart';
import 'package:mobile_app/widgets/common/secondary_button.widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool loading = false;
  void callControl(String action) async {
    await ControlService.control(action);
  }

  @override
  void initState() {
    super.initState();
  }

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
          Row(
            children: [
              SecondaryButton(
                text: 'Up',
                icon: Icons.keyboard_double_arrow_up,
                handlePress: loading
                    ? () {
                        return null;
                      }
                    : () async {
                        callControl('up');
                      },
              ),
              SecondaryButton(
                text: 'Down',
                icon: Icons.keyboard_double_arrow_down,
                handlePress: () async {
                  callControl('down');
                },
              ),
            ],
          ),
          Row(
            children: [
              CustomTextButton(
                text: 'Open',
                handlePress: () async {
                  callControl('open');
                },
              ),
              CustomTextButton(
                handlePress: () async {
                  callControl('close');
                },
                text: 'Close',
              ),
            ],
          )
        ],
      ),
    );
  }
}
