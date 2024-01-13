import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/widgets/common/section_title.dart';

class InputGroup extends StatefulWidget {
  // final String title;
  // final double size;
  const InputGroup({
    super.key,
    // required this.title,
    //  required this.size
  });

  @override
  State<InputGroup> createState() => _InputGroupState();
}

class _InputGroupState extends State<InputGroup> {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        label: SectionTitle(title: 'First Name', size: 15),
        // hintText: 'First Name',
        labelStyle: TextStyle(
          color: Color(0xFF2FE2EE),
          // backgroundColor: Colors.amber

          // fontSize: 100,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabled: true,
        focusColor: Color(0xFF2FE2EE),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            // color: Colors.grey,
            color: Color(0xFF2FE2EE),
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        hoverColor: Color(0xFF2FE2EE),

        // labelText: 'First Name'
// hintStyle:
        // focusedErrorBorder: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(15)))
      ),
    );
  }
}
