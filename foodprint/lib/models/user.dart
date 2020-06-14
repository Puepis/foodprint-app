
import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String _username;
  int _id;
  Map<String, dynamic> payload;
  String jwt;

  User(String username, int id) {
    _username = username;
    _id = id;
  }

  String get username => _username;
  int get id => _id;

}