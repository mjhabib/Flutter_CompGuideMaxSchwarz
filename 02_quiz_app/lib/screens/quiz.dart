import 'package:flutter/material.dart';
import 'question_screen.dart';
import 'start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({
    super.key,
  });

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // to prevent 'the instance member...' error, we need to initialize the line of code below, in an initState method to ensure it only executes once
  // Widget activeScreen = StartScreen(switchScreen);
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.greenAccent, Colors.blueGrey],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
