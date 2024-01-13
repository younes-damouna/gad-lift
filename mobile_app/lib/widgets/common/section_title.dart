import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final double size;
  final Color? color;
  
  const SectionTitle({super.key, required this.title, required this.size,this.color});

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
