import 'package:flutter/material.dart';
import 'package:quiz_app2/screens/questions_screen.dart';
import 'package:quiz_app2/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  bool _showQuestion = false;
  void _showQuestionFunction() {
    setState(() {
      _showQuestion = !_showQuestion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 50, 39, 176),
                Colors.purple,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: _showQuestion
              ? QuestionScreen(
                  backToStartScreen: _showQuestionFunction,
                )
              : StartScreen(
                  onStartQuiz: _showQuestionFunction,
                ),
        ),
      ),
    );
  }
}
