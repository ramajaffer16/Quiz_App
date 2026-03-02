import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String label;
  final int index;
  final bool isSelected;
  final bool isCorrect;
  final bool isWrong;
  final VoidCallback onTap;

  const OptionButton({
    super.key,
    required this.label,
    required this.index,
    required this.isSelected,
    required this.isCorrect,
    required this.isWrong,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor = Colors.white.withOpacity(0.08);
    Color borderColor = Colors.white12;
    Color textColor = Colors.white70;

    if (isCorrect) {
      bgColor = Colors.green.withOpacity(0.2);
      borderColor = Colors.green;
      textColor = Colors.greenAccent;
    } else if (isWrong) {
      bgColor = Colors.red.withOpacity(0.2);
      borderColor = Colors.red;
      textColor = Colors.redAccent;
    } else if (isSelected) {
      bgColor = const Color(0xFF7C3AED).withOpacity(0.2);
      borderColor = const Color(0xFF7C3AED);
      textColor = Colors.white;
    }

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: borderColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  String.fromCharCode(65 + index),
                  style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: TextStyle(color: textColor, fontSize: 15),
              ),
            ),
            if (isCorrect) const Icon(Icons.check_circle, color: Colors.greenAccent, size: 20),
            if (isWrong) const Icon(Icons.cancel, color: Colors.redAccent, size: 20),
          ],
        ),
      ),
    );
  }
}
