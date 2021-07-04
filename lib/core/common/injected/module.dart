import 'package:flutter_boilerplate/config/ui/theme/data/repositories/theme_repository_impl.dart';
import 'package:flutter_boilerplate/config/ui/theme/domain/repositories/theme_repository.dart';
import 'package:flutter_boilerplate/config/ui/theme/ui/stores/theme_store.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureInjection() async {
  getIt.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImp(),
  );
  getIt.registerLazySingleton(() => ThemeStore());
}
