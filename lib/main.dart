import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(FirstApp());
// }

void main() => runApp(FirstApp());

class FirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FirstAppState();
    throw UnimplementedError();
  }
}

class _FirstAppState extends State<FirstApp> {
  final _questions = [
    {
      'questionText': 'What\'s your favourite colour?',
      'answers': [
        {'text': 'Green', 'score': 33},
        {'text': 'blue', 'score': 23},
        {'text': 'black', 'score': 13},
        {'text': 'red', 'score': 3}
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Dog', 'score': 33},
        {'text': 'Cat', 'score': 23},
        {'text': 'Lion', 'score': 13},
        {'text': 'Fish', 'score': 3}
      ],
    },
    {
      'questionText': 'Who\'s your favourite Superhero?',
      'answers': [
        {'text': 'Spiderman', 'score': 33},
        {'text': 'Catwomen', 'score': 23},
        {'text': 'Superman', 'score': 13},
        {'text': 'Ironman', 'score': 3}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    
    setState(() {
      _questionIndex += 1;
    });
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
          title: const Text('My first App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
