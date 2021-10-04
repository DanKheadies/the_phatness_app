import './question.dart';

class QuizBrain {
  int _questionNumber = 0;

  // List<Question3> _questionBank = [
  //   Question3('Some cats are actually allergic to humans.', true),
  //   Question3('You can lead a cow down stairs but not up stairs.', false),
  //   Question3(
  //       'Approximately one quarter of human bones are in the feet.', true),
  //   Question3('A slug\'s blood is green.', true),
  //   Question3('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
  //   Question3('It is illegal to pee in the Ocean in Portugal.', true),
  //   Question3(
  //       'No piece of square dry paper can be folded in half more than 7 times.',
  //       false),
  //   Question3(
  //       'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
  //       true),
  //   Question3(
  //       'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
  //       false),
  //   Question3(
  //       'The total surface area of two human lungs is approximately 70 square metres.',
  //       true),
  //   Question3('Google was originally called \"Backrub\".', true),
  //   Question3(
  //       'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
  //       true),
  //   Question3(
  //       'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
  //       true),
  // ];

  List<Object> _questions = [
    {
      'id': '001',
      'question': 'When were you born?',
      'answers': [
        {
          'text': 'January 1, 1970',
          'score': 1,
        },
        {
          'text': 'April 20, 1969',
          'score': 2,
        },
        {
          'text': 'October 16, 1991',
          'score': 4,
        },
        {
          'text': 'December 25, 1',
          'score': 3,
        },
      ],
      'audio': '',
      'timer': 0,
    }
  ];

  List<Question3> _questions3 = [
    Question3(
      id: '001',
      question: 'When were you born?',
      answers: [
        {
          'text': 'January 1, 1970',
          'score': 1,
        },
        {
          'text': 'April 20, 1969',
          'score': 2,
        },
        {
          'text': 'October 16, 1991',
          'score': 4,
        },
        {
          'text': 'December 25, 1',
          'score': 3,
        },
      ],
      answer: 3,
      timer: 0,
    ),
  ];

  void nextQuestion() {
    // if (_questionNumber < _questionBank.length - 1) {
    //   _questionNumber++;
    // }
    if (_questionNumber < _questions3.length - 1) {
      _questionNumber++;
    }
  }

  void resetQuestions() {
    _questionNumber = 0;
  }

  // bool getQuestionAnswer() {
  //   return _questionBank[_questionNumber].answer;
  // }

  double getQuestionAnswer3() {
    return _questions3[_questionNumber].answer;
  }

  // String getQuestionText() {
  //   return _questionBank[_questionNumber].question;
  // }

  String getQuestionText3() {
    return _questions3[_questionNumber].question;
  }

  bool checkIfQuestionsAreLeft() {
    // if (_questionNumber < _questionBank.length - 1) {
    //   return false;
    // }
    if (_questionNumber < _questions3.length - 1) {
      return false;
    }
    return true;
  }
}
