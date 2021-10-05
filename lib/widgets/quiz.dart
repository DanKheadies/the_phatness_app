// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/models/question.dart';

import './answer.dart';
import './question_text.dart';
import '../models/question.dart';
// import '../models/quiz_brain.dart';

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
  bool isReady = false;
  Duration timeout = Duration(seconds: 3);
  Duration ms = Duration(milliseconds: 1);

  List<Icon> scoreKeeper = [];

  // QuizBrain quizBrain = QuizBrain();

  // @override
  // void initState() {
  //   super.initState();
  //   startTimer();
  // }

  // Timer startTimer([int milliseconds]) {
  //   var duration = milliseconds == null ? timeout : ms * milliseconds;
  //   return Timer(duration, showQuestion);
  // }

  // void showQuestion() {
  //   print('ding');
  //   setState(() {
  //     isReady = true;
  //   });
  // }

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
