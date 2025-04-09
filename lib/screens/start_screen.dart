import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.onStartQuiz});

  final VoidCallback onStartQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 250,
            color: const Color.fromARGB(130, 255, 255, 255),
          ),
          SizedBox(
            height: 20,
          ),
          const Text(
            "Learn flutter the funny way",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
            ),
            onPressed: () {
              onStartQuiz();
            },
            icon: Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
            label: Text(
              "Learn",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
