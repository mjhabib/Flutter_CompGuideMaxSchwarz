class QuizQuestion {
  final String question;
  final List<String> answers;

  const QuizQuestion(this.question, this.answers);

  // Since the current answer of all the questions is the first answer in the list, we need to shuffle the answers, but we don't wanna shuffle our original list because we still need to know the right answer
  List<String> getShuffleAnswers() {
    // the keyword 'List' here is a 'class' whereas the other 'List' before the function name represents a 'type'
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
    // although we are allowed to chain 'shuffle' to our List (List.of(answers).shuffle()), but since its return type is 'void' we get an error. That's why we assign it to a variable so we can return it.
  }
}
