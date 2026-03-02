import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';

class OptionTile extends StatelessWidget {
  final int index;
  final String text;
  const OptionTile({super.key, required this.index, required this.text});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QuizProvider>();
    final answered = provider.answered;
    final isCorrect = index == provider.currentQuestion.correctIndex;
    final isSelected = provider.selectedAnswer == index;

    Color borderColor = Colors.white.withOpacity(0.08);
    Color bgColor = Colors.white.withOpacity(0.04);
    Color textColor = Colors.white70;

    if (answered) {
      if (isCorrect) {
        borderColor = const Color(0xFF4CAF50);
        bgColor = const Color(0xFF4CAF50).withOpacity(0.12);
        textColor = const Color(0xFF4CAF50);
      } else if (isSelected) {
        borderColor = Colors.redAccent;
        bgColor = Colors.redAccent.withOpacity(0.1);
        textColor = Colors.redAccent;
      }
    }

    return GestureDetector(
      onTap: () => provider.selectAnswer(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          children: [
            Container(
              width: 28, height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: borderColor),
              ),
              child: Center(
                child: Text(
                  String.fromCharCode(65 + index), // A, B, C, D
                  style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(child: Text(text, style: TextStyle(color: textColor, fontSize: 15))),
          ],
        ),
      ),
    );
  }
}
