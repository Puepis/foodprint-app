import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodprint/injection.dart';
import 'package:foodprint/presentation/core/app_widget.dart';
import 'package:injectable/injectable.dart';

Future<void> main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  await DotEnv().load();
  configureInjection(Environment.prod);
  runApp(FoodprintApp());
}
