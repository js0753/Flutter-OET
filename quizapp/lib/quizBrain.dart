import 'qna.dart';

class QuizBrain {
  List<QnA> questionBank = [
    QnA(q: "Is Flutter based on Java Programming?", a: false),
    QnA(q: "Sun rises in the East", a: true),
    QnA(
        q: "Widgets in flutter are categorized as Stateful and Stateless",
        a: true),
    QnA(q: "Everything in Flutter is Widget", a: true),
  ];
  int qno = 0;
  String getQuestion() {
    qno += 1;
    return questionBank[qno - 1].question;
  }

  bool getAnswer() {
    return questionBank[qno - 1].answer;
  }

  bool isFinished() {
    if (qno == questionBank.length) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    qno = 0;
  }
}
