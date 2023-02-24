import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
void configureInjection(String env) {
  init(getIt, environment: env);
}

void init(GetIt getIt, {required String environment}) {}
