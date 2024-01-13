import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonTitle extends StatelessWidget {
  final String title;
  final double size;
  final Color color;
  const ButtonTitle({super.key, required this.title, required this.size,required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.zenDots(
        fontSize: size,
        color: color,
        // fontWeight: FontWeight.w900,
      ),
    );
  }
}
