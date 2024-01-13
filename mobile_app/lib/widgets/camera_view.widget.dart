import 'dart:ui';

import 'package:flutter/material.dart';

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
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Camera'),
                    Icon(Icons.camera_alt_outlined),
                  ],
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                        colors: [Colors.grey, Colors.white],
                        // begin: AlignmentDirectional(30, 12),
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    // color: Colors.red,

                    width: double.infinity,
                    // child: const Text('data'),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: (MediaQuery.of(context).size.width / 2) - 40,
              height: 100,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 37, 213, 229),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: TextButton(
                  style: const ButtonStyle(
                    alignment: Alignment.center,
                  ),
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Up',
                      ),
                      Icon(
                        Icons.keyboard_double_arrow_up,
                        color: Colors.black,
                        size: 40,
                      )
                    ],
                  )),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: (MediaQuery.of(context).size.width / 2) - 40,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const Text('data'),
            ),
          ],
        )
      ],
    );
  }
}
