import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/models/question.dart';

import './answer.dart';
import './question.dart';
import '../models/quiz_brain.dart';

class Quiz extends StatefulWidget {
  final Function answerQuestion;
  final int questionIndex;
  // final List<Map<String, Object>> questions;
  final List<Question3> questions;

  Quiz({
    this.answerQuestion,
    this.questionIndex,
    this.questions,
  });

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  bool undercooked = true;
  Duration timeout = Duration(seconds: 3);
  Duration ms = Duration(milliseconds: 1);

  List<Icon> scoreKeeper = [];

  QuizBrain quizBrain = QuizBrain();

  Timer startTimeout([int milliseconds]) {
    var duration = milliseconds == null ? timeout : ms * milliseconds;
    return Timer(duration, handleTimeout);
  }

  void handleTimeout() {
    // callback function
    print('ding');
    setState(() {
      undercooked = false;
    });
  }

  @override
  void initState() {
    super.initState();
    startTimeout(5);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: undercooked
          ? CircularProgressIndicator()
          : Column(
              children: [
                Question(
                    // widget.questions[widget.questionIndex]['question'],
                    widget.questions[widget.questionIndex].question),
                // ...(widget.questions[widget.questionIndex]['answers']
                ...(widget.questions[widget.questionIndex].answers)
                    .map((answer) {
                  return Answer(
                    // () => widget.answerQuestion(answer['score']),
                    () => widget.answerQuestion(answer['score']),
                    // answer['text'],
                    // answer.question,
                    answer['text'],
                    // answer.answers[],
                  );
                }).toList(),
              ],
            ),
    );
  }
}
