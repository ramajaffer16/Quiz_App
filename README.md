# Quiz App

A Flutter quiz app with a countdown timer, animated answer feedback, and a results screen.

## Features
- 8 Flutter knowledge questions (easily extendable)
- 20-second countdown timer per question
- Instant visual feedback — green for correct, red for wrong
- Score and percentage on results screen
- Randomised question order on each attempt

## Tech Stack
- **Flutter** & **Dart**
- **Provider** — state management
- **Timer** — countdown logic

## Getting Started

1. Clone the repo
2. Run `flutter pub get`
3. Run `flutter run`

## Extending Questions
Add more questions in `lib/data/questions_data.dart` following the same `Question` model structure.

## Project Structure
```
lib/
├── main.dart
├── data/
│   └── questions_data.dart
├── models/
│   └── question_model.dart
├── providers/
│   └── quiz_provider.dart
├── screens/
│   ├── start_screen.dart
│   ├── quiz_screen.dart
│   └── results_screen.dart
└── widgets/
    └── option_button.dart
