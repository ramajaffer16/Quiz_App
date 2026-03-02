import '../models/quiz_question.dart';

const List<QuizQuestion> kQuizQuestions = [
  QuizQuestion(
    question: 'What does "UI" stand for in Flutter?',
    options: ['User Interface', 'Universal Input', 'Unified Interaction', 'User Integration'],
    correctIndex: 0,
  ),
  QuizQuestion(
    question: 'What language is Flutter built with?',
    options: ['Kotlin', 'Swift', 'Dart', 'JavaScript'],
    correctIndex: 2,
  ),
  QuizQuestion(
    question: 'Which widget is used for scrollable lists in Flutter?',
    options: ['Column', 'ListView', 'Stack', 'GridView'],
    correctIndex: 1,
  ),
  QuizQuestion(
    question: 'What does "setState" do in Flutter?',
    options: [
      'Initializes the app',
      'Navigates between screens',
      'Triggers a UI rebuild',
      'Connects to the database'
    ],
    correctIndex: 2,
  ),
  QuizQuestion(
    question: 'Which file defines app dependencies in Flutter?',
    options: ['main.dart', 'pubspec.yaml', 'build.gradle', 'settings.json'],
    correctIndex: 1,
  ),
  QuizQuestion(
    question: 'What is a "Widget" in Flutter?',
    options: [
      'A database model',
      'A network request',
      'A description of part of the UI',
      'A background service'
    ],
    correctIndex: 2,
  ),
  QuizQuestion(
    question: 'Which widget centers its child on screen?',
    options: ['Align', 'Padding', 'Center', 'Container'],
    correctIndex: 2,
  ),
  QuizQuestion(
    question: 'What is the entry point of a Flutter app?',
    options: ['runApp()', 'startApp()', 'initApp()', 'launchApp()'],
    correctIndex: 0,
  ),
];
