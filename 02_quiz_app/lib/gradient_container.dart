import 'package:flutter/material.dart';
import 'widgets/quiz_logo.dart';
import 'widgets/intro_text.dart';
import 'widgets/quiz_button.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.greenAccent, Colors.blueGrey],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft),
      ),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            QuizLogo(),
            SizedBox(
              height: 30,
            ),
            IntroText(),
            SizedBox(
              height: 30,
            ),
            QuizButton()
          ],
        ),
      ),
    );
  }
}
