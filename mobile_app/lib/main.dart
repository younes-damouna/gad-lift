import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        appBar: AppBar(
          title:const Center( child: Text('GadLift',),),
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF2FE2EE),
          bottomOpacity: 0.5,
          toolbarHeight: 160,
          elevation: 5.0,
          
                  

          // leadingWidth: 100,
          shadowColor: const Color(0xFF2FE2EE),
          // shape: const CircleBorder(
          //   side: BorderSide(width: 5, color: Colors.purple),
          // ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(1000))),
        ),
        backgroundColor: const Color(0xFFF3F1F1),
        body: Container(
          
          decoration: const BoxDecoration(color: Colors.amber),
          child: const Center(
            child: Text(
              'Hello World!',
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  fontFamily: '',
                  backgroundColor: Color.fromARGB(255, 18, 163, 39)),
            ),
          ),
        ),
      ),
    );
  }
}
