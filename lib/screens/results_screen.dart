import 'package:flutter/material.dart';
import 'package:quiz_app2/data/question_results.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.questionResultsList});
  final List<QuestionResults> questionResultsList;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Hey there am the result screen....",
          )
        ],
      ),
    );
  }
}
