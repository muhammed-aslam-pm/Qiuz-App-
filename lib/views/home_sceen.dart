import 'package:flutter/material.dart';
import 'package:quizz_app/views/result_screen.dart';

import '../utils/database/database.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int questionNo = 0;
  int checkValue = 5;
  int score = 0;

  void onNext() {
    if (questionNo == Database.questions.length - 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(score: score),
        ),
      );
    } else {
      questionNo = questionNo + 1;
    }
    setState(() {});
  }

  void onPrevius() {
    if (questionNo > 0) {
      questionNo--;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, right: 30, left: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text("${questionNo + 1}/10")],
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                Database.questions[questionNo]["question"],
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 70,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      checkValue = index;
                      if (index == Database.questions[questionNo]["answer"]) {
                        score = score + 1;
                      }
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: checkValue == index
                            ? checkValue ==
                                    Database.questions[questionNo]["answer"]
                                ? Colors.green
                                : Colors.red
                            : Colors.blue,
                      ),
                      height: 50,
                      width: 350,
                      child: Center(
                          child: Text(
                        Database.questions[questionNo]["options"][index],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                  ),
                ),
                itemCount: 4,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      onPrevius();
                    },
                    child: const Text("<- Previus"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      onNext();
                      checkValue = 5;
                      setState(() {});
                    },
                    child: const Text("Next ->  "),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
