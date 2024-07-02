import 'package:flutter/material.dart';
import '../widgets/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'question',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 30),
          AnswerButton('answer 1', () {}),
          const SizedBox(height: 20),
          AnswerButton('answer 2', () {}),
          const SizedBox(height: 20),
          AnswerButton('answer 3', () {}),
          const SizedBox(height: 20),
          AnswerButton('answer 4', () {}),
        ],
      ),
    );
  }
}
