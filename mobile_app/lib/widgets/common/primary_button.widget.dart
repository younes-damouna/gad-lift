import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/common/button_title.widget.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final Color color;

  const PrimaryButton({super.key, required this.text, required this.color});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      // height: 100,
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
        onPressed: () => {},
        style: const ButtonStyle(
          
          // textStyle: MaterialStatePropertyAll(),
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
            ),
          ],
        ),
      ),
    );
  }
}
