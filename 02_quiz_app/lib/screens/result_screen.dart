import 'package:flutter/material.dart';
import '../widgets/question_summery.dart';
import '../data/questions.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  const ResultScreen({super.key, required this.chosenAnswers});

  // replaced with a getter
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;
    // replaced with an arrow function

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!'),
            QuestionSummery(summaryData: summaryData),
            TextButton(onPressed: () {}, child: const Text('Restart quiz'))
          ],
        ),
      ),
    );
  }
}
