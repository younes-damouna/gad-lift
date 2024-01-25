
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
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),

         
            height: 200,
            child: Column(
              children: [
             
                Expanded(
                  child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                     
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                     

                      width: double.infinity,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            
                            'assets/images/banner.jpg',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ))),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
