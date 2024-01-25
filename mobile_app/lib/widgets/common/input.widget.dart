import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/widgets/common/section_title.dart';

class InputGroup extends StatefulWidget {
  final String title;
  final bool secure;
  final IconData icon;
  final TextEditingController controller;
  final Color? color;
  final bool? numpad;
  // final double size;
  const InputGroup(
      {super.key,
      required this.controller,
      required this.title,
      required this.secure,
      required this.icon,
      this.color,
      this.numpad
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
        // height: 50,

        margin: const EdgeInsets.symmetric(vertical: 2),
        child: Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              // keyboardType: widget.numpad?? TextInputType.number ,
              style: TextStyle(
                  color: widget.color ?? const Color.fromARGB(255, 0, 0, 0)),

              onFieldSubmitted: (value) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter ${widget.title}';
                }
                return null;
              },

              controller: widget.controller,
              scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              // autovalidateMode: AutovalidateMode.always,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              // keyboardAppearance: Brightness.da,
              // autofocus: true,
              // keyboardType: TextInputType.emailAddress,
              obscureText: widget.secure,
              cursorColor: const Color(0xFF2FE2EE),

              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 13.0, horizontal: 10.0),
                errorStyle: const TextStyle(),
                errorBorder: const OutlineInputBorder(
                  // gapPadding: 12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                floatingLabelStyle:
                    TextStyle(color: widget.color ?? const Color.fromARGB(255, 0, 0, 0)),
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
                  color: widget.color ?? const Color.fromARGB(255, 0, 0, 0),
                ),

                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),

                enabled: true,
                focusColor: widget.color ?? const Color.fromARGB(255, 0, 0, 0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    // color: Colors.grey,
                    color: widget.color ?? const Color.fromARGB(255, 0, 0, 0),
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
                hoverColor: widget.color ?? const Color.fromARGB(255, 0, 0, 0),

                // labelText: 'First Name'
                // hintStyle:
                // focusedErrorBorder: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(15)))
              ),
            ),
          ),
        ));
  }
}
