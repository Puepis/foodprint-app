
import 'package:flutter/material.dart';

class PhotoModel extends ChangeNotifier {
  // TODO: convert to Map instead
  String coords = "";
  String address = "";
  String datetime = "";
  String name = "";
  String caption = "";
  String price = "";
  bool _saved = false;
  bool get saved => _saved;
  void setSaved() {
    _saved = true;
    notifyListeners();
  }
}