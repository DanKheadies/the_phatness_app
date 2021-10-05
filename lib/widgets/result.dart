import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function resetHandler;
  final int resultScore;

  Result(this.resetHandler, this.resultScore);

  String get resultPhrase {
    String resultText;
    if (resultScore >= 52) {
      resultText = 'Perfect. Your next clue is...';
    } else if (resultScore >= 45) {
      resultText =
          'Ohhh.. You\'re pretty gosh darn close. Here\'s a prety gosh darn close hint: ';
    } else if (resultScore > 20) {
      resultText = 'Bruh.';
    } else {
      resultText = 'Pity.. You feel right into my snake liar.';
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
