import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/common/button_title.widget.dart';

class SecondaryButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final Function handlePress;

  const SecondaryButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.handlePress});

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: (MediaQuery.of(context).size.width / 2) - 40,
      height: 100,
      decoration: const BoxDecoration(
        color: Color(0xf1f1f1f1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () => widget.handlePress(),
        style: const ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          overlayColor:
              MaterialStatePropertyAll(Color.fromARGB(67, 47, 225, 238)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTitle(
              title: widget.text,
              size: 20,
              color: Colors.black,
            ),
            // SizedBox(width: 10,),
            Icon(
              widget.icon,
              color: Colors.black,
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}
