import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final questions = [
    {
      'questionText': 'wasdhat\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'what\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ]
    },
    {
      'questionText': 'what\'s your favorite person?',
      'answers': [
        {'text': 'me', 'score': 1},
        {'text': 'ian', 'score': 2},
        {'text': 'its me', 'score': 3},
        {'text': 'Yep', 'score': 4},
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _onClickQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < questions.length) {
      print(_questionIndex);
      print(_totalScore);
    } else {}
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                onClickQuestion: _onClickQuestion,
                questions: questions,
                questionIndex: _questionIndex)
            : Result(resultScore: _totalScore, resetHandler: _resetQuiz),
      ),
    );
  }
}
