import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      label: const Text(
        'Start Quiz',
        style: TextStyle(fontSize: 18),
      ),
      icon: const Icon(Icons.arrow_right_alt),
    );
  }
}
