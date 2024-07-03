import 'package:flutter/material.dart';

class QuizLogo extends StatelessWidget {
  const QuizLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/images/quiz-logo.png'),
      width: 250,
      color: Color.fromARGB(150, 255, 255, 255),
    );
    // return const Opacity(
    //   opacity: 0.6,
    //   child: Image(
    //     image: AssetImage('assets/images/quiz-logo.png'),
    //     width: 250,
    //   ),
    // );
    // Not recommended because it's not performance efficient for larger apps
  }
}
