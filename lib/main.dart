import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Quiz app",
    home: MyQuizePage(),
  ));
}

class MyQuizePage extends StatefulWidget {
  const MyQuizePage({Key? key}) : super(key: key);

  @override
  _MyQuizePageState createState() => _MyQuizePageState();
}

class _MyQuizePageState extends State<MyQuizePage> {
  int qtsId = 1;
  String snackMessage = "";
  var qtss = [
    {
      "qts": "Flutter is an open-source UI toolkit",
      "ans": true,
      "image": "images/ima1.png"
    },
    {
      "qts": "Is Flutter a programming language?",
      "ans": false,
      "image": "images/ima2.png"
    },
    {
      "qts":
          " Dart is a object-oriented programming language ,he is used to create a frontend user interfaces.",
      "ans": true,
      "image": "images/ima3.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlue, title: Text("Question/Réponse")),
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  color: Colors.white,
                  child: Image.asset(qtss[qtsId]['image'] as String),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        qtss[qtsId]["qts"] as String,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ))),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (qtss[qtsId]["ans"] == true) {
                            snackMessage = "The answer is correct";
                            final snackBar = SnackBar(
                              content: Text(snackMessage),
                              action: SnackBarAction(
                                label: 'next question',
                                onPressed: () {},
                              ),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            snackMessage = "Sorry,Try again";
                            final snackBar = SnackBar(
                              content: Text(snackMessage),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        });
                      },
                      child: Text("Vrai")),
                )),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (qtss[qtsId]["ans"] == false) {
                              snackMessage = "The answer is correct";
                              final snackBar = SnackBar(
                                content: Text(snackMessage),
                                action: SnackBarAction(
                                  label: 'next question',
                                  onPressed: () {
                                    setState(() {
                                      if (qtsId != qtss.length - 1) {
                                        qtsId = qtsId + 1;
                                        snackMessage = "";
                                      } else {
                                        snackMessage = "";
                                        qtsId = 0;
                                      }
                                    });
                                  },
                                ),
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              snackMessage = "Sorry,Try again";
                              final snackBar = SnackBar(
                                content: Text(snackMessage),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          });
                        },
                        child: Text("Faux")))
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (qtsId != qtss.length - 1) {
                        qtsId = qtsId + 1;
                        snackMessage = "";
                      } else {
                        snackMessage = "";
                        qtsId = 0;
                      }
                    });
                  },
                  child: Icon(
                    Icons.arrow_forward,
                  )),
            )
          ],
        )),
      ),
    );
  }
}

_checkAnswer(bool userchoice, BuildContext context) {}

_nextQuestion() {}
