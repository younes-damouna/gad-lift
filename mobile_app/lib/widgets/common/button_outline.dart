import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/common/button_title.widget.dart';

class CustomOutlinedButton extends StatefulWidget {
  final String text;
  final Color color;
  final Color bgColor;
  final Function handlePress;
  const CustomOutlinedButton(
      {super.key,
      required this.text,
      required this.color,
      required this.bgColor,
      required this.handlePress});

  @override
  State<CustomOutlinedButton> createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(vertical: 10),
      // padding: const EdgeInsets.all(10),
      // height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: widget.bgColor),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        // boxShadow: const [
        //   BoxShadow(
        //     color: Colors.grey,
        //     blurRadius: 5,
        //     offset: Offset(0, 0),
        //   ),
        // ],
      ),
      child: TextButton(
        onPressed: () => widget.handlePress(),
        style: const ButtonStyle(
          // textStyle: MaterialStatePropertyAll(),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          overlayColor:
              MaterialStatePropertyAll(Color.fromARGB(103, 255, 193, 7)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTitle(
              title: widget.text,
              size: 20,
              color:widget.color,
            ),
          ],
        ),
      ),
    );
  }
}
