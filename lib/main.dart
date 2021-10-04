import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import './dummy_data.dart';
import './widgets/start_text.dart';
import 'widgets/quiz.dart';
import 'widgets/result.dart';

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
  bool visible1 = false;
  bool visible2 = false;
  bool visible3 = false;
  bool visible4 = false;
  bool visible5 = false;
  bool visible6 = false;
  String titleSong = '../assets/audio/title.mp3';
  var _questionIndex = 0;
  var _totalScore = 0;
  var timeout = Duration(seconds: 3);
  var ms = Duration(milliseconds: 1);

  @override
  void initState() {
    super.initState();

    audioPlayer = new AudioPlayer();
    audioCache = new AudioCache(
      fixedPlayer: audioPlayer,
    );

    audioCache.loop(titleSong);

    startTimeout(1);

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

  void playSong(String audio) {
    audioCache.clearAll();
    audioCache.play(audio);
  }

  Timer startTimeout(int milliseconds) {
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
    });

    if (!visible6) startTimeout(2000);
  }

  void _answerQuestion(int score) {
    print('derp');
    print(score);
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    // print(_questionIndex);

    // if (_questionIndex < PHATs.length) {
    //   print('Another question!');
    // } else {
    //   print('No more questions please and thank you.');
    // }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      hasStarted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
              ? _questionIndex < questions3.length
                  ? Quiz(
                      answerQuestion: _answerQuestion,
                      questionIndex: _questionIndex,
                      questions: questions3,
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
                        duration: 3000,
                      ),
                      StartText(
                        text: 'Can\'t go over it',
                        size: 18,
                        isVisible: visible2,
                        duration: 2000,
                      ),
                      StartText(
                        text: 'Can\'t go under it',
                        size: 18,
                        isVisible: visible3,
                        duration: 2000,
                      ),
                      StartText(
                        text: 'Can\'t go around it',
                        size: 18,
                        isVisible: visible4,
                        duration: 2000,
                      ),
                      StartText(
                        text: 'Got to go through it',
                        size: 18,
                        isVisible: visible5,
                        duration: 2000,
                      ),
                      AnimatedOpacity(
                        curve: Curves.linear,
                        opacity: visible6 ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 2000),
                        child: TextButton(
                          child: Text('Make sure sound is on n_n'),
                          style: ButtonStyle(),
                          onPressed: () {
                            print('music file');
                            playSong(titleSong);
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
                            setState(() {
                              hasStarted = true;
                            });
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
