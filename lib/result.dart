import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback resetHandler;
  Result(this.score, this.resetHandler);

  String get resultPhrase {
    print(score);
    String resultText;
    if (score <= 33) {
      resultText = 'Aweful';
    } else if (score <= 66) {
      resultText = "nice";
    } else {
      resultText = 'Very good';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultPhrase + ', you got ' + score.toString(),
          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        TextButton(
          onPressed: resetHandler,
          child: const Text(
            'Reset Quiz',
            style: TextStyle(color: Colors.white),
          ),
          style: TextButton.styleFrom(backgroundColor: Colors.blue),
        )
      ]
          .map((e) => Padding(
                padding: const EdgeInsets.all(80),
                child: e,
              ))
          .toList(),
    ));
  }
}
