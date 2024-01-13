import 'package:flutter/material.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0x63FFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(10)),
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
        color: const Color.fromARGB(22, 22, 22, 22),
        height: 200,
        child: const Text('data'),
      ),
    );
  }
}
