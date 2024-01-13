import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
  });

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
          style: const ButtonStyle(
            alignment: Alignment.center,
          ),
          onPressed: () {},
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Up',
              ),
              Icon(
                Icons.keyboard_double_arrow_up,
                color: Colors.black,
                size: 40,
              )
            ],
          )),
    );
  }
}
