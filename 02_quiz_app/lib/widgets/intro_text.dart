import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Welcome to the quiz app',
      style: GoogleFonts.lato(color: Colors.white, fontSize: 24),
    );
  }
}
