import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import 'quiz_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F17),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('🧠', style: TextStyle(fontSize: 64)),
              const SizedBox(height: 24),
              const Text('Flutter Quiz',
                  style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w200, letterSpacing: 3)),
              const SizedBox(height: 12),
              const Text('8 questions · 15 seconds each',
                  style: TextStyle(color: Colors.white38, fontSize: 14, letterSpacing: 1)),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<QuizProvider>().startQuiz();
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B8FFF),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: const Text('Start Quiz', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QuizProvider>();
    final score = provider.score;
    final total = provider.questions.length;
    final pct = (score / total * 100).round();

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F17),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(pct >= 70 ? '🎉' : '📚', style: const TextStyle(fontSize: 64)),
              const SizedBox(height: 24),
              Text('$score / $total',
                  style: const TextStyle(color: Colors.white, fontSize: 64, fontWeight: FontWeight.w200)),
              const SizedBox(height: 8),
              Text('$pct% correct',
                  style: const TextStyle(color: Colors.white38, letterSpacing: 2, fontSize: 14)),
              const SizedBox(height: 12),
              Text(
                pct == 100 ? 'Perfect score!' : pct >= 70 ? 'Great job!' : 'Keep practising!',
                style: const TextStyle(color: Color(0xFF5B8FFF), fontSize: 18),
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    provider.reset();
                    Navigator.popUntil(context, (r) => r.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B8FFF),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: const Text('Play Again', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
