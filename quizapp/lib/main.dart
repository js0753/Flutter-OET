import 'package:flutter/material.dart';
//import 'qna.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain qb = new QuizBrain();
void main() {
  runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: Colors.blue,
    body: QuizApp(),
  )));
}

class QuizApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizApp> {
  List<Widget> result = [];
  int score = 0;

  void checkAnswer(bool x) {
    if (qb.isFinished()) {
      bool correctAns = qb.getAnswer();
      if (correctAns == x) score += 1;
      Alert(
        context: context,
        title: 'Done!',
        desc: 'You\'ve reached the end of the quiz.\nScore : $score',
      ).show();
      qb.reset();
      score = 0;
      setState(() {
        result = [];
      });
    } else {
      bool correctAns = qb.getAnswer();
      setState(() {
        if (correctAns == x) {
          score += 1;

          result.add(Icon(
            Icons.check,
            color: Colors.lightGreen,
          ));
        } else {
          result.add(
            Icon(
              Icons.close,
              color: Colors.redAccent,
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 5,
            child: Center(
              child: Text(
                qb.getQuestion(),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )),
        FlatButton(
            minWidth: 250,
            height: 75,
            color: Colors.green,
            onPressed: () {
              checkAnswer(true);
            },
            child: Text("True")),
        SizedBox(
          height: 25,
        ),
        FlatButton(
            minWidth: 250,
            height: 75,
            color: Colors.red,
            onPressed: () {
              checkAnswer(false);
            },
            child: Text("False")),
        Row(
          children: result,
        ),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
