// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//login page
TextStyle ralewayStyle = GoogleFonts.raleway();

//ui
class PrimaryText extends StatelessWidget {
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final double height;
  const PrimaryText({
    Key? key,
    required this.size,
    required this.fontWeight,
    required this.color,
    required this.text,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          color: color, height: height, fontSize: size, fontWeight: fontWeight),
    );
  }
}
