import 'package:flutter/material.dart';
import 'package:mobile_app/main.dart';
// import 'package:mobile_app/main.dart';
class MyAppBar extends StatelessWidget  implements PreferredSizeWidget  {
  const MyAppBar({
    super.key,
  });
  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
          // scrolledUnderElevation: 1,
          
          // excludeHeaderSemantics: true,
          title: Column(
            children: [
              screenTitle(title: 'GadLift', size: 50),
            screenTitle(title: 'Lift Your Gadgets With Us', size: 10),],
          ),
          bottom:  const PreferredSize(
            preferredSize: Size(100, 100),
            child: Text(''),
            // child: Text(
            //   'hello',
            // )
          ),
          // foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF2FE2EE),
          bottomOpacity: 0.5,
          // toolbarHeight: 140,
          
          toolbarHeight: 80,
          elevation: 5.0,
          leadingWidth: 40,
          titleTextStyle:  const TextStyle(
            color: Colors.white,
          ),

          // leadingWidth: 100,
          shadowColor:  const Color(0xFF2FE2EE),
          // shape: const CircleBorder(
          //   side: BorderSide(width: 5, color: Colors.purple),
          // ),
          shape: const RoundedRectangleBorder(
            
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(1000))),
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
