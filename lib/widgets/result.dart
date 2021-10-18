import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function resetHandler;
  final int resultScore;

  Result(this.resetHandler, this.resultScore);

  String get resultPhrase {
    String resultText;
    if (resultScore >= 52) {
      resultText =
          'Congratulations! You did it!! Now for clue #7 aka the "money shot." Have you looked under your bed today?';
    } else if (resultScore >= 45) {
      resultText =
          'Ohhh.. You\'re pretty gosh darn close. Here\'s a prety gosh darn close hint: skate better.';
    } else if (resultScore > 20) {
      resultText = 'Pity.. You feel right into my snake liar. GG RE';
    } else {
      resultText = 'Bruh... Did you even try?';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            // textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text(
              'Restart Quiz!',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
