import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key,
      required this.answerText,
      required this.onSelectAnswer,
      required this.onSettingAnswer});

  final String answerText;
  final VoidCallback onSelectAnswer;
  final VoidCallback onSettingAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: ElevatedButton(
        onPressed: () {
          onSelectAnswer();
          onSettingAnswer();
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 155, 130, 130),
          backgroundColor: const Color.fromARGB(255, 69, 15, 78),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
            vertical: MediaQuery.of(context).size.height * 0.02,
          ),
        ),
        child: Text(answerText),
      ),
    );
  }
}
