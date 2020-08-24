import 'package:flutter/material.dart';

class WalkthroughModel extends ChangeNotifier {
  bool showWalkthrough;
  int screen = 0;

  void next() {
    screen++;
    notifyListeners();
  }

  void prev() {
    screen--;
    notifyListeners();
  }

  void finish() {
    showWalkthrough = false;
    screen = 0;
    notifyListeners();
  }

  WalkthroughModel({this.showWalkthrough});
}
