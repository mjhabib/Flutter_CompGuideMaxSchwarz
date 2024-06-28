import 'package:flutter/material.dart';
import '../screens/questions_screen.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const QuestionsScreen()),
        );
      },
      label: const Text(
        'Start Quiz',
        style: TextStyle(fontSize: 18),
      ),
      icon: const Icon(Icons.arrow_right_alt),
    );
  }
}
