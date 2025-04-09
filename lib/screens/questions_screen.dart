import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.backToStartScreen});
  final VoidCallback backToStartScreen;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Questions Screen",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: null,
            child: Text("Question 1"),
          ),
          ElevatedButton(
            onPressed: null,
            child: Text("Question 2"),
          ),
          ElevatedButton(
            onPressed: null,
            child: Text("Question 3"),
          ),
          ElevatedButton(
            onPressed: null,
            child: Text("Question 4"),
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
        ],
      ),
    );
  }
}
