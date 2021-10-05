class Question {
  final String id;
  final String question;
  final List<Map<String, Object>> answers;
  final double answer;
  final double timer;
  final String audio;

  Question({
    this.id,
    this.question,
    this.answers,
    this.answer,
    this.timer,
    this.audio,
  });
}
