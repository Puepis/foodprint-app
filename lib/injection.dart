
import 'package:foodprint/injection.iconfig.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';


final GetIt getIt = GetIt.instance;

// Generates singletons and factories for us - dependency injection
// - the code generation can be found in injection.iconfig.dart

@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);
}