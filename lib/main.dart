import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import './models/quiz_brain.dart';
import './widgets/quiz.dart';
import './widgets/result.dart';
import './widgets/start_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  AudioCache audioCache;
  AudioPlayer audioPlayer;
  bool hasStarted = false;
  bool isReady = true;
  bool visible1 = false;
  bool visible2 = false;
  bool visible3 = false;
  bool visible4 = false;
  bool visible5 = false;
  bool visible6 = false;
  Color spinnerColor = Colors.blue;
  List<Icon> scoreKeeper = [];
  String titleSong = '../assets/audio/title.mp3';
  QuizBrain quizBrain = QuizBrain();
  var _questionIndex = 0;
  var _totalScore = 0;
  var _standardTime = 2000;
  var timeout = Duration(seconds: 3);
  var ms = Duration(milliseconds: 1);

  @override
  void initState() {
    super.initState();

    audioPlayer = new AudioPlayer();
    audioCache = new AudioCache(
      fixedPlayer: audioPlayer,
    );

    audioCache.play(titleSong);

    startTimer(500);

    if (hasStarted) {
      setState(() {
        visible1 = true;
        visible2 = true;
        visible3 = true;
        visible4 = true;
        visible5 = true;
        visible6 = true;
      });
    }
  }

  void setColor() {
    Color newColor =
        Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    setState(() {
      spinnerColor = newColor;
    });
  }

  Timer startTimer(int milliseconds) {
    var duration = milliseconds == null ? timeout : ms * milliseconds;
    return Timer(duration, showText);
  }

  void showText() {
    setState(() {
      if (visible5)
        visible6 = true;
      else if (visible4)
        visible5 = true;
      else if (visible3)
        visible4 = true;
      else if (visible2)
        visible3 = true;
      else if (visible1)
        visible2 = true;
      else
        visible1 = true;

      if (!isReady) {
        setState(() {
          isReady = !isReady;
        });
      }
    });

    if (!visible6) startTimer(_standardTime);
  }

  void playSong(String audio) {
    audioCache.clearAll();
    audioCache.play(audio);
  }

  void _stopAudio() {
    audioPlayer.stop();
    audioCache.clearAll();
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      if (score == 4) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }

      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < quizBrain.questions3.length) {
      if (quizBrain.questions3[_questionIndex].audio != '') {
        playSong(quizBrain.questions3[_questionIndex].audio);
        startTimer(quizBrain.questions3[_questionIndex].timer.round() * 1000);
        setState(() {
          isReady = false;
        });
      }
    } else {
      if (_totalScore >= 52) playSong('../assets/audio/bezos.mp3');
    }
  }

  void _resetQuiz() {
    _stopAudio();
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      hasStarted = false;
      scoreKeeper = [];
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('P.H.A.T.'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.restart_alt),
              onPressed: _resetQuiz,
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 15,
          ),
          child: hasStarted
              ? _questionIndex < quizBrain.questions3.length
                  ? RawMaterialButton(
                      onPressed: () {
                        setColor();
                      },
                      onLongPress: () {
                        setState(() {
                          isReady = true;
                        });
                      },
                      child: Quiz(
                        answerQuestion: _answerQuestion,
                        questionIndex: _questionIndex,
                        questions: quizBrain.questions3,
                        showQuestion: isReady,
                        color: spinnerColor,
                        scoreKeeper: scoreKeeper,
                      ),
                    )
                  : Result(
                      _resetQuiz,
                      _totalScore,
                    )
              : Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      StartText(
                        text: 'YOU GOIN ON A BEAR HUNT',
                        size: 48,
                        isVisible: visible1,
                        duration: _standardTime + 1000,
                      ),
                      StartText(
                        text: 'Can\'t go over it',
                        size: 18,
                        isVisible: visible2,
                        duration: _standardTime,
                      ),
                      StartText(
                        text: 'Can\'t go under it',
                        size: 18,
                        isVisible: visible3,
                        duration: _standardTime,
                      ),
                      StartText(
                        text: 'Can\'t go around it',
                        size: 18,
                        isVisible: visible4,
                        duration: _standardTime,
                      ),
                      StartText(
                        text: 'Got to go through it',
                        size: 18,
                        isVisible: visible5,
                        duration: _standardTime,
                      ),
                      AnimatedOpacity(
                        curve: Curves.linear,
                        opacity: visible6 ? 1.0 : 0.0,
                        duration: Duration(milliseconds: _standardTime),
                        child: TextButton(
                          child: Text('Make sure sound is on n_n'),
                          style: ButtonStyle(),
                          onPressed: () {
                            if (visible6) playSong(titleSong);
                          },
                        ),
                      ),
                      AnimatedOpacity(
                        curve: Curves.linear,
                        opacity: visible6 ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 2000),
                        child: ElevatedButton(
                          child: Text('LEGGO'),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 10.0,
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (visible6) {
                              setState(() {
                                _stopAudio();
                                hasStarted = true;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
          // child: _questionIndex < questions3.length
          //     ? Quiz(
          //         answerQuestion: _answerQuestion,
          //         questionIndex: _questionIndex,
          //         questions: questions3,
          //       )
          //     : Result(
          //         _resetQuiz,
          //         _totalScore,
          //       ),
        ),
      ),
    );
  }
}
