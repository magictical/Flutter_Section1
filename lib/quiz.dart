import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function onClickQuestion;

  Quiz(
      {@required this.questions,
      @required this.questionIndex,
      @required this.onClickQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => onClickQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
