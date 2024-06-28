import 'package:flutter/material.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Welcome to the quiz app',
      style: TextStyle(color: Colors.white, fontSize: 24),
    );
  }
}
