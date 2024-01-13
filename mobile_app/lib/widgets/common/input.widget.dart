import 'package:flutter/material.dart';

class InputGroup extends StatefulWidget {
  // final String title;
  // final double size;
  const InputGroup({super.key, 
  // required this.title,
  //  required this.size
   });

  @override
  State<InputGroup> createState() => _InputGroupState();
}

class _InputGroupState extends State<InputGroup> {
  @override
  Widget build(BuildContext context) {
    return const InputChip(label: Text('data'));
  }
}
