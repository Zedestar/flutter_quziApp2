import 'package:flutter/material.dart';
import 'package:quiz_app2/components/question_answer_button.dart';
import 'package:quiz_app2/data/quiz_quesions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app2/functions/navigating_screen_function.dart';
import 'package:quiz_app2/functions/taking_result_callback_function.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    // required this.backToStartScreen,
    required this.navigateTo,
    required this.takeQuestionResults,
  });
  final TakeQuestionResultsCallback takeQuestionResults;
  // final Function backToStartScreen;
  final NavigationScreenCallback navigateTo;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionIndexNumber = 0;
  late var currentQuestion;

  @override
  void initState() {
    super.initState();
    currentQuestion = quizQuestions[questionIndexNumber];
  }

  void functionToChangeQuestion() {
    setState(() {
      if (questionIndexNumber < quizQuestions.length - 1) {
        questionIndexNumber++;
        currentQuestion = quizQuestions[questionIndexNumber];
      } else {
        widget.navigateTo("resultsScreen");
        // widget.backToStartScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(currentQuestion.questionText,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
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
                ...currentQuestion.getShuffledAnswers().map(
                  (answer) {
                    return AnswerButton(
                      answerText: answer,
                      onSelectAnswer: functionToChangeQuestion,
                      onSettingAnswer: () {
                        widget.takeQuestionResults(
                          currentQuestion.questionText,
                          currentQuestion.answers[0],
                          answer,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




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