import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color(0xFFF3F1F1),
      body: Container(
        margin: const EdgeInsets.all(20),
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
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Device Status'), Icon(Icons.circle,color: Colors.green,)],
            
          ),
        ),
      ),
    );
  }
}
