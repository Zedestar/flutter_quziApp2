import 'package:flutter/material.dart';
import 'package:quiz_app2/components/question_answer_button.dart';
import 'package:quiz_app2/data/quiz_quesions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app2/functions/navigating_screen_function.dart';
import 'package:quiz_app2/functions/taking_result_callback_function.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.navigateTo,
    required this.takeQuestionResults,
  });
  final TakeQuestionResultsCallback takeQuestionResults;
  final NavigationScreenCallback navigateTo;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionIndexNumber = 0;
  late var currentQuestion;
  late List<String> shuffledAnswers;

  // @override
  // void initState() {
  //   super.initState();
  //   currentQuestion = quizQuestions[questionIndexNumber];
  //   shuffledAnswers = currentQuestion.getShuffledAnswers();
  // }

  void functionToChangeQuestion() {
    setState(() {
      if (questionIndexNumber < quizQuestions.length - 1) {
        currentQuestion = quizQuestions[questionIndexNumber];
        shuffledAnswers = currentQuestion.getShuffledAnswers();
        questionIndexNumber++;
      } else {
        widget.navigateTo("resultsScreen");
        // widget.backToStartScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    currentQuestion = quizQuestions[questionIndexNumber];
    shuffledAnswers = currentQuestion.getShuffledAnswers();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.questionText,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
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
                ...shuffledAnswers.map(
                  (answer) {
                    return AnswerButton(
                      answerText: answer,
                      onSettingAnswer: () {
                        widget.takeQuestionResults(
                          currentQuestion.questionText,
                          currentQuestion.answers[0],
                          answer,
                        );
                        print(
                          "Question: ${currentQuestion.questionText}, Correct Answer: ${currentQuestion.answers[0]}, User Answer: $answer",
                        );
                      },
                      onSelectAnswer: functionToChangeQuestion,
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
