import 'package:flutter/cupertino.dart';
import 'package:tp01_exo02/question.dart';

class questionaire_state extends ChangeNotifier {
  List<Question> questionsList = [
    Question("Flutter is an open-source UI toolkit", true),
    Question("Is Flutter a programming language?", false),
    Question(
        "Dart is a object-oriented programming language ,he is used to create a frontend user interfaces.",
        true)
  ];
  int currentIndex = 0;

  is_true() {}

  is_false() {}
  next() {
    if (currentIndex != questionsList.length - 1) {
      currentIndex++;
    } else {
      currentIndex = 0;
    }
    notifyListeners();
  }
}
