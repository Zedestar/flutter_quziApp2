import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app2/data/question_results.dart';
import 'package:quiz_app2/functions/navigating_screen_function.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.questionResultsList,
    required this.navigateTo,
  });
  final List<QuestionResults> questionResultsList;
  final NavigationScreenCallback navigateTo;

  @override
  Widget build(BuildContext context) {
    int correctAnsersCount = 0;
    for (int i = 0; i < questionResultsList.length; i++) {
      if (questionResultsList[i].userAnswer ==
          questionResultsList[i].correntAnswer) {
        correctAnsersCount++;
      }
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Got right $correctAnsersCount out of ${questionResultsList.length}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),

          // Use a constrained height ListView so it doesn't overflow
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
              itemCount: questionResultsList.length,
              itemBuilder: (context, index) {
                final result = questionResultsList[index];
                final isCorrect = result.userAnswer == result.correntAnswer;

                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isCorrect
                        ? const Color.fromARGB(255, 82, 37, 133)
                        : const Color.fromARGB(255, 112, 42, 37),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Q${index + 1}: ${result.questionText}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text("Your Answer: ${result.userAnswer}"),
                      Text("Correct Answer: ${result.correntAnswer}"),
                    ],
                  ),
                );
              },
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {
              navigateTo("startScreen");
            },
            label: Text(
              "Retake the quiz",
              style: GoogleFonts.lato(color: Colors.white),
            ),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 82, 37, 133),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
