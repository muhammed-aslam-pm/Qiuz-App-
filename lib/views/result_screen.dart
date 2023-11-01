import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quizz_app/views/home_sceen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your score : $score",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 40),
            ),
            SizedBox(
              height: 200,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHome(),
                    ),
                  );
                },
                child: Text("Try Again"))
          ],
        )),
      ),
    );
  }
}
