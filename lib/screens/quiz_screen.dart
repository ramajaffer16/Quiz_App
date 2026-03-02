import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/option_button.dart';
import 'results_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, provider, _) {
        if (provider.status == QuizStatus.finished) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const ResultsScreen()),
            );
          });
        }

        final question = provider.currentQuestion;

        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF1A0533), Color(0xFF2D1B69)],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Progress & timer
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: LinearProgressIndicator(
                              value: provider.progress,
                              backgroundColor: Colors.white12,
                              valueColor: const AlwaysStoppedAnimation(Color(0xFF7C3AED)),
                              minHeight: 6,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        _TimerBadge(timeLeft: provider.timeLeft),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${provider.currentIndex + 1} / ${provider.totalQuestions}',
                      style: const TextStyle(color: Colors.white38, fontSize: 13),
                    ),
                    const SizedBox(height: 32),

                    // Question
                    Text(
                      question.question,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Options
                    ...List.generate(question.options.length, (i) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: OptionButton(
                          label: question.options[i],
                          index: i,
                          isSelected: provider.selectedAnswer == i,
                          isCorrect: provider.isAnswered && i == question.correctIndex,
                          isWrong: provider.isAnswered &&
                              provider.selectedAnswer == i &&
                              i != question.correctIndex,
                          onTap: () => provider.selectAnswer(i),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TimerBadge extends StatelessWidget {
  final int timeLeft;
  const _TimerBadge({required this.timeLeft});

  @override
  Widget build(BuildContext context) {
    final color = timeLeft > 10
        ? const Color(0xFF7C3AED)
        : timeLeft > 5
            ? Colors.orange
            : Colors.red;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Text(
        '${timeLeft}s',
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
