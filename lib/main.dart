import 'package:flutter/material.dart';
import 'package:quize_app/quiz.dart';
import 'package:quize_app/result.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 5},
        {'text': 'Red', 'score': 7},
        {'text': 'Green', 'score': 2}
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Dog', 'score': 2},
        {'text': 'Cat', 'score': 5},
        {'text': 'Parrot', 'score': 6},
        {'text': 'Gorilla', 'score': 10}
      ],
    },
    {
      'questionText': 'Who is your favourite singer?',
      'answers': [
        {'text': 'Jennifer from the block', 'score': 10},
        {'text': 'Britney Spears', 'score': 7},
        {'text': 'Rihanna', 'score': 4},
        {'text': 'Beyonce', 'score': 3}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('question index: ' + _questionIndex.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            )
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
