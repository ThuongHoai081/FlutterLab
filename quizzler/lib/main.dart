import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final tickIcon = Icon(Icons.check, color: Colors.green);
  final crossIcon = Icon(Icons.clear, color: Colors.red);
  int count = 0;
  List<Icon> iconsList = [];

  final List<Question> questionsList = [
    Question('Môn Lập trình đa nền tảng học vào sáng thứ 6?', true),
    Question('Bạn sẽ được điểm A môn kiểm thử?', true),
    Question('1 + 1 = 11 ?', false),
    Question('Giảng viên dạy Môn Lập trình đa nền tảng là thầy ThS Ngô Lê Quân', true),
    Question('Bạn đẹp gái mà đúng không?', true),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF333333),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    if (count >= questionsList.length) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '🎉 Chúc mừng bạn đã hoàn thành!',
                style: TextStyle(color: Colors.white, fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _resetQuiz,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Text(
                    'Làm lại',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 110, left: 20, right: 20),
            child: Text(
              questionsList[count].question,
              style: TextStyle(color: Colors.white, fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'True',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              onPressed: () {
                _checkAnswer(true);
              },
            ),
            SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'False',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              onPressed: () {
                _checkAnswer(false);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(children: iconsList),
            )
          ],
        ),
      ],
    );
  }

  void _checkAnswer(bool selectedAnswer) {
    if (count < questionsList.length) {
      setState(() {
        if (selectedAnswer == questionsList[count].correctAnswer) {
          iconsList.add(tickIcon);
        } else {
          iconsList.add(crossIcon);
        }
        count++;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      count = 0;
      iconsList.clear();
    });
  }
}
