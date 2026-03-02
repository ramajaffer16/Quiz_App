import '../models/question_model.dart';

const List<Question> quizQuestions = [
  Question(
    question: 'What programming language is Flutter built with?',
    options: ['Kotlin', 'Swift', 'Dart', 'JavaScript'],
    correctIndex: 2,
  ),
  Question(
    question: 'Which widget is used for scrollable lists in Flutter?',
    options: ['Column', 'ListView', 'Stack', 'Row'],
    correctIndex: 1,
  ),
  Question(
    question: 'What is the entry point function in a Flutter app?',
    options: ['start()', 'init()', 'runApp()', 'main()'],
    correctIndex: 3,
  ),
  Question(
    question: 'Which class is the base for all Flutter UI components?',
    options: ['Widget', 'View', 'Component', 'Element'],
    correctIndex: 0,
  ),
  Question(
    question: 'What does "hot reload" do in Flutter?',
    options: [
      'Restarts the app completely',
      'Injects updated code without restarting',
      'Clears the cache',
      'Rebuilds the APK',
    ],
    correctIndex: 1,
  ),
  Question(
    question: 'Which widget in Flutter clips its child into a circle?',
    options: ['ClipRect', 'CircleAvatar', 'ClipOval', 'Both B and C'],
    correctIndex: 3,
  ),
  Question(
    question: 'What is `BuildContext` used for in Flutter?',
    options: [
      'Managing app state',
      'Network requests',
      'Locating the widget in the tree',
      'Handling navigation',
    ],
    correctIndex: 2,
  ),
  Question(
    question: 'Which state management approach comes built-in with Flutter?',
    options: ['Riverpod', 'setState', 'Bloc', 'Redux'],
    correctIndex: 1,
  ),
];
