import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final IconData icon;

  const TextFieldInput({
    super.key,
    required this.textEditingController, 
    this.isPass = false, 
    required this.hintText, 
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        obscureText: isPass,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.lato(
            color: Colors.black45,
            fontSize: 18,
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.black45,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          border: InputBorder.none,
          filled: true,
          fillColor: Color(0xFFedf0f8),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(50),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.blue),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
