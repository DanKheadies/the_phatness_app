import './question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> questions3 = [
    Question(
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
      audio: '',
    ),
    Question(
      id: '002',
      question: 'Why did Obama send the immigrants?',
      answers: [
        {
          'text': 'He didn\'t',
          'score': 1,
        },
        {
          'text': 'To distract from PizzaGate',
          'score': 2,
        },
        {
          'text': 'To vaccinate your kids',
          'score': 4,
        },
        {
          'text': 'Something something gay frogs',
          'score': 3,
        },
      ],
      answer: 3,
      timer: 0,
      audio: '',
    ),
    Question(
      id: '003',
      question: 'Why are Cubans like socks?',
      answers: [
        {
          'text': 'You always lose them in the dryers',
          'score': 1,
        },
        {
          'text': 'Two\'s better than one',
          'score': 3,
        },
        {
          'text': 'They\'re all dirty',
          'score': 4,
        },
        {
          'text': 'They keep your feet warm',
          'score': 2,
        },
      ],
      answer: 3,
      timer: 0,
      audio: '',
    ),
    Question(
      id: '004',
      question:
          'If Bo is planning on killing himself in 2030, how old will he be?',
      answers: [
        {
          'text': '39.0',
          'score': 3,
        },
        {
          'text': '40.0',
          'score': 4,
        },
        {
          'text': '41.0',
          'score': 1,
        },
        {
          'text': '42.0',
          'score': 2,
        },
      ],
      answer: 2,
      timer: 141,
      audio: '../assets/audio/30.mp3',
    ),
    Question(
      id: '005',
      question: 'How do you get from the Eastern Kingdoms to Kalimdor?',
      answers: [
        {
          'text': 'Swim',
          'score': 1,
        },
        {
          'text': 'Run',
          'score': 3,
        },
        {
          'text': 'Zeppelin',
          'score': 4,
        },
        {
          'text': 'You don\'t',
          'score': 2,
        },
      ],
      answer: 3,
      timer: 0,
      audio: '',
    ),
    Question(
      id: '006',
      question:
          'If you were a murderous sippy cup, what would you say right before you slayed your victims?',
      answers: [
        {
          'text': 'Drink ME',
          'score': 4,
        },
        {
          'text': 'Shabbalagoo',
          'score': 3,
        },
        {
          'text': 'I\'m going to slay you now',
          'score': 1,
        },
        {
          'text': 'You can run but you can\'t hide, bitch',
          'score': 2,
        },
      ],
      answer: 1,
      timer: 0,
      audio: '',
    ),
    Question(
      id: '007',
      question:
          'In The Story of Dan Kheadies, what is the name of the child that has soiled himself?',
      answers: [
        {
          'text': 'Bobert',
          'score': 1,
        },
        {
          'text': 'Canaan',
          'score': 2,
        },
        {
          'text': 'Nesbit',
          'score': 4,
        },
        {
          'text': 'Tevin',
          'score': 3,
        },
      ],
      answer: 3,
      timer: 0,
      audio: '',
    ),
    Question(
      id: '008',
      question: 'Who is suppose to buy wards for river?',
      answers: [
        {
          'text': 'Mid',
          'score': 1,
        },
        {
          'text': 'Support',
          'score': 3,
        },
        {
          'text': 'Anyone that can',
          'score': 4,
        },
        {
          'text': 'Jungle',
          'score': 2,
        },
      ],
      answer: 3,
      timer: 0,
      audio: '',
    ),
    Question(
      id: '009',
      question: 'How much is a ZJ?',
      answers: [
        {
          'text': '\$4.20',
          'score': 1,
        },
        {
          'text': '\$10',
          'score': 2,
        },
        {
          'text': '\$15',
          'score': 3,
        },
        {
          'text': 'If you have to ask, you can\'t afford it.',
          'score': 4,
        },
      ],
      answer: 4,
      timer: 0,
      audio: '',
    ),
    Question(
      id: '010',
      question:
          'If you had one shot or one opportunity to seize everything you wanted in one moment, would you capture it or just let it slip?',
      answers: [
        {
          'text': 'Yes',
          'score': 3,
        },
        {
          'text': 'No',
          'score': 2,
        },
        {
          'text': 'Mom\'s spaghetti',
          'score': 4,
        },
        {
          'text': 'There\'s no right answer',
          'score': 1,
        },
      ],
      answer: 3,
      timer: 0,
      audio: '',
    ),
    Question(
      id: '011',
      question: 'What goes on a Taco Dog?',
      answers: [
        {
          'text':
              'Deli mustard, slaw, homemade chipotle sauce and Scott\'s homemade mild pepper relish',
          'score': 4,
        },
        {
          'text':
              'Deli mustard, Scott\'s homemade hot pepper relish, and jalapenos',
          'score': 3,
        },
        {
          'text':
              'Deli mustard, sweet pickle relish, banana peppers, tomatoes, celery salt',
          'score': 2,
        },
        {
          'text':
              'Meat, rice, beans, salsa, cheese, lettuce, guacamole, and sour cream',
          'score': 1,
        },
      ],
      answer: 1,
      timer: 0,
      audio: '',
    ),
    Question(
      id: '012',
      question: 'Who is the greatest rapper ever, ever?',
      answers: [
        {
          'text': 'Dylan',
          'score': 1,
        },
        {
          'text': 'Dylan',
          'score': 2,
        },
        {
          'text': 'Bo',
          'score': 4,
        },
        {
          'text': 'Dylan',
          'score': 3,
        },
      ],
      answer: 4,
      timer: 43,
      audio: '../assets/audio/boYo.mp3',
    ),
    Question(
      id: '013',
      question: 'When do you think this quiz will stop?',
      answers: [
        {
          'text': 'IDK',
          'score': 1,
        },
        {
          'text': 'In 4m 20s',
          'score': 2,
        },
        {
          'text': 'Any day now',
          'score': 4,
        },
        {
          'text': 'Probably when you answer the last question',
          'score': 3,
        },
      ],
      answer: 3,
      timer: 3,
      audio: '../assets/audio/anyDayNow.mp3',
    ),
  ];

  void nextQuestion() {
    if (_questionNumber < questions3.length - 1) {
      _questionNumber++;
    }
  }

  void resetQuestions() {
    _questionNumber = 0;
  }

  double getQuestionAnswer() {
    return questions3[_questionNumber].answer;
  }

  String getQuestionText() {
    return questions3[_questionNumber].question;
  }

  bool checkIfQuestionsAreLeft() {
    // if (_questionNumber < _questionBank.length - 1) {
    //   return false;
    // }
    if (_questionNumber < questions3.length - 1) {
      return false;
    }
    return true;
  }
}
