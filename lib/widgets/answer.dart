import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        // horizontal: 30.0,
        vertical: 10.0,
      ),
      child: ElevatedButton(
        child: Text(answerText),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10.0,
            ),
          ),
        ),
        onPressed: selectHandler,
      ),
    );
  }
}
