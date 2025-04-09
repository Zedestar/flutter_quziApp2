import 'package:flutter/material.dart';
import 'package:quiz_app2/components/question_answer_button.dart';
import 'package:quiz_app2/data/quiz_quesions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.backToStartScreen});
  final VoidCallback backToStartScreen;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestion = quizQuestions[3];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.questionText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 10,
                ),
                ...currentQuestion.answers.map(
                  (answer) {
                    return AnswerButton(
                      answerText: answer,
                      onSelectAnswer: () {},
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),

      // OutlinedButton.icon(
      //   style: OutlinedButton.styleFrom(
      //     foregroundColor: Colors.white,
      //     padding: const EdgeInsets.symmetric(
      //       horizontal: 20,
      //       vertical: 10,
      //     ),
      //   ),
      //   onPressed: () {
      //     widget.backToStartScreen();
      //   },
      //   icon: const Icon(
      //     Icons.arrow_back,
      //     color: Colors.white,
      //   ),
      //   label: const Text(
      //     "Back",
      //     style: TextStyle(
      //         fontSize: 20,
      //         fontWeight: FontWeight.bold,
      //         color: Colors.white),
      //   ),
      // ),
    );
  }
}
