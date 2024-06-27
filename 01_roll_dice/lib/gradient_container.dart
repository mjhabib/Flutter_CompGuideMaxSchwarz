import 'package:flutter/material.dart';
import 'styled_text.dart';

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  final List<Color> gradientColors;

  const GradientContainer({super.key, required this.gradientColors});
  // named argument

  // GradientContainer.purple({super.key}) : gradientColors = [];
  // an alternative constructor with predefined parameters

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: beginAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/dice-1.png',
              width: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: rollDice,
              child: const StyledText('Roll Dice'),
              // style:
              //     TextButton.styleFrom(padding: const EdgeInsets.only(top: 20)),
            ),
          ],
        ),
      ),
    );
  }

  void rollDice() {}
}
