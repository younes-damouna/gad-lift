import 'package:flutter/material.dart';
// import 'package:mobile_app/main.dart';
class MyAppBar extends StatelessWidget   {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // excludeHeaderSemantics: true,
      // title: screenTitle(title: 'GadLift', size: 50),
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF2FE2EE),
      bottomOpacity: 0.5,
      toolbarHeight: 160,
      elevation: 5.0,
      leadingWidth: 40,
    
      // leadingWidth: 100,
      shadowColor: const Color(0xFF2FE2EE),
      // shape: const CircleBorder(
      //   side: BorderSide(width: 5, color: Colors.purple),
      // ),
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(1000))),
    );
  }
}
