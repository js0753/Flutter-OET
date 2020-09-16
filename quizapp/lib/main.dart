import 'package:flutter/material.dart';

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
  List questions = ["Is Flutter based on Java Programming?"];
  List<bool> answers = [false];
  List<Widget> result = [];
  int score = 0;
  int qno = -1;
  String getQuestion() {
    qno += 1;
    return questions[qno];
  }

  void checkAnswer(bool x) {
    if (answers[qno] == x) {
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
                getQuestion(),
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
      ],
    );
  }
}
