import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.title,
      required this.color,
      required this.weight,
      required this.size,
      this.align});

  final String title;
  final Color color;
  final FontWeight weight;
  final double size;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: align,
      style: GoogleFonts.montserrat(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
