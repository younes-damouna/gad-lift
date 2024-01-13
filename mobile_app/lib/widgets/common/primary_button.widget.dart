import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/common/button_title.widget.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final Color color;
  final Color bgColor;

  const PrimaryButton({super.key, required this.text, required this.color,required this.bgColor});

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
      decoration:  BoxDecoration(
        color: widget.bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: const [
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
              MaterialStatePropertyAll(Color.fromARGB(146, 153, 228, 233)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTitle(
              title: widget.text,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
