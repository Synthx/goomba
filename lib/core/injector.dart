import 'package:get_it/get_it.dart';
import 'package:goomba/data/data.dart';

final getIt = GetIt.instance;

void setupInjector() {
  getIt.registerLazySingleton(() => AuthService());
  getIt.registerLazySingleton(() => PlayerService());
}
