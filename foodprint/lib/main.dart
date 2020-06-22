
import 'package:flutter/material.dart';
import 'package:foodprint/injection.dart';
import 'package:foodprint/presentation/core/app_widget.dart';
import 'package:injectable/injectable.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(FoodprintApp());
}

