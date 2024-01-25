// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/chart.widget.dart';
import 'package:mobile_app/widgets/common/section_title.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                //  const Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     SectionTitle(title: 'Camera', size: 15),
                //     Icon(Icons.camera_alt_outlined),
                //   ],
                // ),
                Expanded(
                  child: Container(

                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      // gradient: LinearGradient(
                      //   colors: [Colors.grey, Colors.white],
                      //   // begin: AlignmentDirectional(30, 12),
                      // ),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    // color: Colors.red,

                    width: double.infinity,
                    child:  ClipRRect(
  borderRadius: BorderRadius.circular(10),child:Image.asset('assets/images/banner.jpg',width: double.infinity,fit: BoxFit.cover,))
                    
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
