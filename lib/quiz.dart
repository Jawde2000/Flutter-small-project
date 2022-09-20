import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  Quiz({required this.questions, required this.questionIndex, required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText'].toString()),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((ans) {
          return Answer(() => answerQuestion(ans['score']), ans["text"].toString());
        }).toList()
      ]
          .map((e) => Padding(
                padding: const EdgeInsets.all(8),
                child: e,
              ))
          .toList(),
    );
  }
}
