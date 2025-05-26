import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AppLargeText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  AppLargeText({super.key, 
  this.size = 30,
  required this.text,
  this.color=Colors.teal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.notoSerif(
        color: color, 
        fontSize: size,
        fontWeight: FontWeight.bold 
        ),
    );
  }
}