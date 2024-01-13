import 'package:flutter/material.dart';

class SecondaryButton extends StatefulWidget {
  final String text;
  final IconData icon;
  const SecondaryButton({super.key, required this.text, required this.icon});

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
        onPressed: () => {},
        style: const ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          overlayColor:
              MaterialStatePropertyAll(Color.fromARGB(67, 47, 225, 238)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style: const TextStyle(
                fontSize: 25,
                // fontFamily:
                color: Colors.black,
              ),
            ),
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
