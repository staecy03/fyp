import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mansau_sabah/components.dart/button.dart';
//import 'package:google_fonts/google_fonts.dart';

class IntroPage  extends StatefulWidget{
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
  }
  
  class _IntroPageState extends State<IntroPage> {

    @override
      Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'), // Or NetworkImage for online images
            fit: BoxFit.cover, // Or BoxFit.fill, BoxFit.contain, etc.
          ),
        ),
        child: Center( // Your page content goes here
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Mansau Sabah',
                style: GoogleFonts.dmSerifDisplay(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 3,
                ),
              ),
              const SizedBox(height: 45),

              Text(
                'Welcome!',
                style: GoogleFonts.dmSerifDisplay(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height:2),

              Text(
                'We are so glad to have you here.',
                style: GoogleFonts.dmSerifDisplay(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height:2),

              Text(
                'We will guide and bring you to a fulfilling stay.',
                style: GoogleFonts.dmSerifDisplay(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height:95),

              MyButton(text:
              " Get Started",
              onTap: () {
                Navigator.pushNamed(context, '/loginpage');
              },
              
              )
            ],
          ),
        ),
      ),
    );
  }
}

