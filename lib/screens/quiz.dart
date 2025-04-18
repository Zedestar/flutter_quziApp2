import 'package:flutter/material.dart';
import 'package:quiz_app2/data/question_results.dart';
import 'package:quiz_app2/screens/questions_screen.dart';
import 'package:quiz_app2/screens/results_screen.dart';
import 'package:quiz_app2/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String currentScreen = "startScreen";
  List<QuestionResults> questionResultsList = [];
  void settingQuestionResults(
      String questionText, String correctAnswer, String userAnswer) {
    QuestionResults questionResults = QuestionResults(
      questionText: questionText,
      correntAnswer: correctAnswer,
      userAnswer: userAnswer,
    );
    questionResults.settingAnswer(correctAnswer, userAnswer);
    questionResultsList.add(questionResults);
  }

  void changerStartQuestionScreen(String screenToSet) {
    setState(() {
      currentScreen = screenToSet;
    });
  }

  Widget _theScreenFunction(String screenToSet) {
    switch (screenToSet) {
      case "startScreen":
        return StartScreen(navigateTo: changerStartQuestionScreen);
      case "questionScreen":
        return QuestionScreen(
          navigateTo: changerStartQuestionScreen,
          takeQuestionResults: settingQuestionResults,
        );
      case "resultsScreen":
        return ResultsScreen(
          questionResultsList: questionResultsList,
          navigateTo: changerStartQuestionScreen,
        );
      default:
        return StartScreen(navigateTo: changerStartQuestionScreen);
    }
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
          child: _theScreenFunction(currentScreen),
        ),
      ),
    );
  }
}
