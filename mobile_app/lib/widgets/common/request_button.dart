import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/common/button_title.widget.dart';

class RequestButton extends StatefulWidget {
  final String text;

  final Function handlePress;
  const RequestButton(
      {super.key, required this.text, required this.handlePress});

  @override
  State<RequestButton> createState() => _RequestButtonState();
}

class _RequestButtonState extends State<RequestButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 2),
        // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: const BoxDecoration(
          // color: Color.fromARGB(98, 255, 255, 255),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xf1f1f1f1),
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
              // textStyle: MaterialStatePropertyAll(),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              overlayColor:
                  MaterialStatePropertyAll(Color.fromARGB(146, 153, 228, 233)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonTitle(
                  title: widget.text,
                  size: 12,
                  color: Colors.black,
                ),
                const Icon(
                  Icons.circle,
                  color: Colors.black,
                ),
              ],
            )));
  }
}
