import 'package:flutter/material.dart';
import '../widgets/quiz_logo.dart';
import '../widgets/intro_text.dart';
import '../widgets/quiz_button.dart';

class StartScreen extends StatelessWidget {
  // accepting a Function as a positional argument
  final void Function() changeScreen;
  const StartScreen(this.changeScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const QuizLogo(),
          const SizedBox(height: 30),
          const IntroText(),
          const SizedBox(height: 30),
          QuizButton(
            startQuiz: changeScreen,
          )
        ],
      ),
    );
  }
}
