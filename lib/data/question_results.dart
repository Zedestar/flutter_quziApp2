class QuestionResults {
  QuestionResults({
    required this.questionText,
    required this.correntAnswer,
    required this.userAnswer,
  });
  final String questionText;
  final String correntAnswer;
  final String userAnswer;
  late bool isCorrect;
  void settingAnswer(String correctAnswer, String userAnswer) {
    if (correctAnswer == userAnswer) {
      isCorrect = true;
    } else {
      isCorrect = false;
    }
  }
}
