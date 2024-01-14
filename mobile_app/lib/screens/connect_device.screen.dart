import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/app_bar.widget.dart';

import 'package:mobile_app/widgets/navigation.widget.dart';

class ConnectDeviceScreen extends StatelessWidget {
  const ConnectDeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: 'Connect Device'),
      backgroundColor: Color(0xFFF3F1F1),
      body: Center(child: Text('Connect')),
      // bottomNavigationBar: Navigation(),
    );
  }
}
