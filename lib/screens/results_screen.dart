import 'package:flutter/material.dart';
import 'package:quiz_app2/data/question_results.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.questionResultsList});
  final List<QuestionResults> questionResultsList;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < questionResultsList.length; i++) {
      print("Question ${i + 1}: ${questionResultsList[i].questionText}");
      print("Your Answer: ${questionResultsList[i].userAnswer}");
      print("Correct Answer: ${questionResultsList[i].correntAnswer}");
    }
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Question results........",
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
                    color: isCorrect ? Colors.green : Colors.red,
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
        ],
      ),
    );
  }
}
