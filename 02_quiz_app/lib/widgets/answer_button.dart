import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String textAnswer;
  final void Function() onTap;
  const AnswerButton(this.textAnswer, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsetsDirectional.symmetric(
              vertical: 10, horizontal: 30),
          backgroundColor: const Color.fromARGB(255, 40, 85, 42),
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      child: Text(
        textAnswer,
        textAlign: TextAlign.center,
      ),
    );
  }
}
