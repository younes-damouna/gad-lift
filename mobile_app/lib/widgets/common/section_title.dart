import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final double size;
  const SectionTitle({super.key, required this.title, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.zenDots(
        fontSize: size,
        color: Colors.black,
        // fontWeight: FontWeight.w900,
      ),
    );
  }
}
