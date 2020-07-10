
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodprint/injection.dart';
import 'package:foodprint/presentation/core/app_widget.dart';
import 'package:injectable/injectable.dart';

Future<void> main() async {
  // TODO: Add font license
  await DotEnv().load();
  configureInjection(Environment.prod);
  runApp(FoodprintApp());
}

