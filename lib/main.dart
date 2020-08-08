import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodprint/injection.dart';
import 'package:foodprint/presentation/core/app_widget.dart';
import 'package:injectable/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Add font licenses
  LicenseRegistry.addLicense(() async* {
    final rubik_license =
        await rootBundle.loadString('google_fonts_rubik/OFL.txt');
    final montserrat_license =
        await rootBundle.loadString('google_fonts_montserrat/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], rubik_license);
    yield LicenseEntryWithLineBreaks(['google_fonts'], montserrat_license);
  });
  await DotEnv().load(); // env variables
  configureInjection(Environment.prod);
  runApp(FoodprintApp());
}
