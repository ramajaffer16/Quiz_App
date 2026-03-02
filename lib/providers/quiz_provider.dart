import 'dart:async';
import 'package:flutter/material.dart';
import '../data/questions_data.dart';
import '../models/question_model.dart';

enum QuizStatus { idle, active, finished }

class QuizProvider extends ChangeNotifier {
  static const int _timePerQuestion = 20;

  final List<Question> _questions = List.from(quizQuestions)..shuffle();

  int _currentIndex = 0;
  int _score = 0;
  int _timeLeft = _timePerQuestion;
  QuizStatus _status = QuizStatus.idle;
  int? _selectedAnswer;
  bool _isAnswered = false;
  Timer? _timer;

  int get currentIndex => _currentIndex;
  int get score => _score;
  int get timeLeft => _timeLeft;
  int get totalQuestions => _questions.length;
  QuizStatus get status => _status;
  int? get selectedAnswer => _selectedAnswer;
  bool get isAnswered => _isAnswered;
  Question get currentQuestion => _questions[_currentIndex];
  double get progress => (_currentIndex) / _questions.length;

  void startQuiz() {
    _currentIndex = 0;
    _score = 0;
    _status = QuizStatus.active;
    _startTimer();
    notifyListeners();
  }

  void selectAnswer(int index) {
    if (_isAnswered) return;

    _selectedAnswer = index;
    _isAnswered = true;
    _timer?.cancel();

    if (index == currentQuestion.correctIndex) {
      _score++;
    }

    notifyListeners();

    Future.delayed(const Duration(seconds: 1), _nextQuestion);
  }

  void _nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;
      _selectedAnswer = null;
      _isAnswered = false;
      _startTimer();
    } else {
      _status = QuizStatus.finished;
      _timer?.cancel();
    }
    notifyListeners();
  }

  void _startTimer() {
    _timeLeft = _timePerQuestion;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_timeLeft > 0) {
        _timeLeft--;
        notifyListeners();
      } else {
        t.cancel();
        selectAnswer(-1); // time out = wrong
      }
    });
  }

  void reset() {
    _timer?.cancel();
    _questions.shuffle();
    _currentIndex = 0;
    _score = 0;
    _status = QuizStatus.idle;
    _selectedAnswer = null;
    _isAnswered = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
