import 'package:flutter/material.dart';
import 'package:mobile_app/screens/main_view.screen.dart';

// import 'package:mobile_app/main.dart';
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final CircleAvatar? avatar;
  const MyAppBar({super.key, required this.title, this.avatar});
  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // scrolledUnderElevation: 1,

      // excludeHeaderSemantics: true,
      title: Column(
        children: [
          screenTitle(title: title, size: 30),
          screenTitle(title: 'Lift Your Gadgets With Us', size: 10),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size(100, 100),
        // child: CircleAvatar(child:  Image.asset('assets/images/AnimatedLogo1.png',width: 200,),),
        child: Column(
          children: [Center(child: avatar), const Text('')],
        ),
        // child: Text(
        //   '',
        // ),
      ),
      // foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF2FE2EE),
      bottomOpacity: 0.5,
      // toolbarHeight: 140,

      toolbarHeight: 80,
      // toolbarHeight: 100,
      elevation: 5.0,
      leadingWidth: 40,
      titleTextStyle: const TextStyle(
        color: Colors.white,
      ),

      // leadingWidth: 100,
      shadowColor: const Color(0xFF2FE2EE),
      // shape: const CircleBorder(
      //   side: BorderSide(width: 5, color: Colors.purple),
      // ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(1000),
        ),
      ),
    );

    // AppBar(
    //   // excludeHeaderSemantics: true,
    //   // title: screenTitle(title: 'GadLift', size: 50),
    //   foregroundColor: Colors.white,
    //   backgroundColor: const Color(0xFF2FE2EE),
    //   bottomOpacity: 0.5,
    //   toolbarHeight: 160,
    //   elevation: 5.0,
    //   leadingWidth: 40,

    //   // leadingWidth: 100,
    //   shadowColor: const Color(0xFF2FE2EE),
    //   // shape: const CircleBorder(
    //   //   side: BorderSide(width: 5, color: Colors.purple),
    //   // ),
    //   shape: const RoundedRectangleBorder(
    //       borderRadius:
    //           BorderRadius.vertical(bottom: Radius.circular(1000))),
    // );
  }
}
