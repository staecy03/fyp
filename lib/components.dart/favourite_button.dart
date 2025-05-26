import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const FavouriteButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.teal.shade700,
            borderRadius: BorderRadius.circular(50)),
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: GoogleFonts.dmSerifDisplay(
                  color: Colors.white, fontSize: 14, letterSpacing: 1),
            ),
            const SizedBox(width: 20),
            Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
