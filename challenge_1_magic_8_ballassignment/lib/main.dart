import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
  MaterialApp(
    home: MyApp(),
  ),
);


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: Text('Magic 8 ball'),
      ),
      body: Ball(),
    );
  }
}

// Creates a Stateful widget
class Ball extends StatefulWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          setState(() {
            // Random.nextInt(n) returns a random integer from 0 to n-1
            ballNumber = Random().nextInt(5) + 1;
          });
        },
        // Adding images
        child: Image.asset('assets/images/ball$ballNumber.png'),
      ),
    );
  }
}