class QuestionModel {
  QuestionModel({required this.questionText, required this.answers});

  String questionText;
  List<String> answers;

  List getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
