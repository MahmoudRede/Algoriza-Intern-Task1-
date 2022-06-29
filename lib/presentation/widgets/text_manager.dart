import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextManager extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  const TextManager(
      {
        required this.text,
        required this.color,
        this.fontWeight=FontWeight.normal,
        required this.fontSize,
        Key? key,
      }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.roboto(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight
    ),
      textAlign: TextAlign.center,
    );
  }
}
