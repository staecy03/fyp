import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItineraryButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const ItineraryButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110,
        height: 50,
        padding: EdgeInsets.only(right: 10, left: 15, top: 15, bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 32, 116, 88),
        ),
        child: Text(
          label,
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
