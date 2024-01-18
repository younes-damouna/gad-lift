
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/widgets/common/section_title.dart';

class InputGroup extends StatefulWidget {
  final String title;
  final bool secure;
  final IconData icon;
  final TextEditingController controller;
  final Color? color;
  // final double size;
  const InputGroup(
      {super.key,
      required this.controller,
      required this.title,
      required this.secure,
      required this.icon,
      this.color,
       //  required this.size
      });

  @override
  State<InputGroup> createState() => _InputGroupState();
}

class _InputGroupState extends State<InputGroup> {
  @override
  Widget build(BuildContext context) {
    // widget.controller.buildTextSpan(context: context, withComposing: false);
    return Container(
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: TextFormField(
              style:  TextStyle(color: widget.color ?? const Color.fromARGB(255, 0, 0, 0)),

              onFieldSubmitted: (value) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },

              controller: widget.controller,
              scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              // autovalidateMode: AutovalidateMode.always,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              // keyboardAppearance: Brightness.da,
              autofocus: true,
              // keyboardType: TextInputType.emailAddress,
              obscureText: widget.secure,
              cursorColor: const Color(0xFF2FE2EE),

              decoration: InputDecoration(
                errorStyle: const TextStyle(),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                floatingLabelStyle:  TextStyle(color: widget.color ?? const Color(0xFF2FE2EE)),
                label: SectionTitle(
                  title: widget.title,
                  size: 15,
                  // color: Colors.grey,
                ),
                // hintText: 'First Name',
                labelStyle: const TextStyle(
                  // color: Color(0xFF2FE2EE)
                  // color: Colors.red,

                  // backgroundColor: Colors.amber
                  color: Colors.grey,
                  // decorationColor: Colors.amber

                  // backgroundColor: Colors.amber

                  // fontSize: 100,
                ),
                // errorText: 'First Name Required!',
                // helperText: 'hi',
                // hintText: "hello",
                // prefixText: ,

                suffix: Icon(
                  widget.icon,
                  color: widget.color ?? const Color(0xFF2FE2EE),
                ),

                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),

                enabled: true,
                focusColor:  widget.color ?? const Color(0xFF2FE2EE),
                focusedBorder:  OutlineInputBorder(
                  borderSide: BorderSide(
                    // color: Colors.grey,
                    color: widget.color ?? const Color(0xFF2FE2EE),
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
                hoverColor: widget.color ?? const Color(0xFF2FE2EE),

                // labelText: 'First Name'
                // hintStyle:
                // focusedErrorBorder: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(15)))
              ),
            ),
          ),
        ));
  }
}
