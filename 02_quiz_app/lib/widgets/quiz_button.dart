import 'package:flutter/material.dart';
// import '../screens/question_screen.dart';

class QuizButton extends StatelessWidget {
  // accepting a function as a named argument
  final void Function() startQuiz;
  const QuizButton({super.key, required this.startQuiz});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: startQuiz,
      // Alternative syntax

      // onPressed: () {
      //   startQuiz();
      // },

      // onPressed: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => const QuestionsScreen()),
      //   );
      // },
      // This method could help us to navigate to a different screen but the problem was, the second screen has no ui tied to it. That's why we used the 'Rendering Content Conditionally' & 'Lifting Up State' method to produce the same result. But now, we can use the same ui we defined for the first screen.
      label: const Text(
        'Start Quiz',
        style: TextStyle(fontSize: 18),
      ),
      icon: const Icon(Icons.arrow_right_alt),
    );
  }
}
