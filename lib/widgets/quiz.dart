import 'package:flutter/material.dart';

import './answer.dart';
import './question_text.dart';
import '../models/question.dart';

class Quiz extends StatefulWidget {
  final Function answerQuestion;
  final int questionIndex;
  final List<Question> questions;
  final bool showQuestion;
  final Color color;
  final List<Icon> scoreKeeper;

  Quiz({
    this.answerQuestion,
    this.questionIndex,
    this.questions,
    this.showQuestion,
    this.color,
    this.scoreKeeper,
  });

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.questions[widget.questionIndex].timer > 0 &&
              !widget.showQuestion
          ? CircularProgressIndicator(
              color: widget.color,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: <Widget>[
                    QuestionText(
                        widget.questions[widget.questionIndex].question),
                    ...(widget.questions[widget.questionIndex].answers)
                        .map((answer) {
                      return Answer(
                        () => widget.answerQuestion(answer['score']),
                        answer['text'],
                      );
                    }).toList(),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: Row(
                    children: widget.scoreKeeper,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ],
            ),
    );
  }
}
