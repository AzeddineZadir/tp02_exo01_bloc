import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp01_exo02/questionaire_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => questionaire_state())
      ],
      child: MaterialApp(
        routes: {"/": (context) => MyQuizePage()},
      ),
    );
  }
}

class MyQuizePage extends StatefulWidget {
  const MyQuizePage({Key? key}) : super(key: key);

  @override
  _MyQuizePageState createState() => _MyQuizePageState();
}

class _MyQuizePageState extends State<MyQuizePage> {
  int qtsId = 1;
  String snackMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlue, title: Text("Question/Réponse")),
      body: SafeArea(
        child: Consumer<questionaire_state>(builder: (context, value, child) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    color: Colors.white,
                    child:
                        Image.asset("images/ima${value.currentIndex + 1}.png"),
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
                          value.questionsList[value.currentIndex].qstText,
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
                          if (value.questionsList[value.currentIndex].ans ==
                              true) {
                            snackMessage = "The answer is correct";
                            final snackBar = SnackBar(
                              content: Text(snackMessage),
                              action: SnackBarAction(
                                label: 'next question',
                                onPressed: () {
                                  Provider.of<questionaire_state>(context,
                                          listen: false)
                                      .next();
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
                        },
                        child: Text("Vrai")),
                  )),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            if (value.questionsList[value.currentIndex].ans ==
                                false) {
                              snackMessage = "The answer is correct";
                              final snackBar = SnackBar(
                                content: Text(snackMessage),
                                action: SnackBarAction(
                                  label: 'next question',
                                  onPressed: () {
                                    Provider.of<questionaire_state>(context,
                                            listen: false)
                                        .next();
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
                          },
                          child: Text("Faux")))
                ],
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Provider.of<questionaire_state>(context, listen: false)
                          .next();
                    },
                    child: Icon(
                      Icons.arrow_forward,
                    )),
              )
            ],
          ));
        }),
      ),
    );
  }
}

_checkAnswer(bool userchoice, BuildContext context) {}

_nextQuestion() {}
