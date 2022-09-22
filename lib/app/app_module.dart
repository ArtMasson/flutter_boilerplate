import 'package:flutter_boilerplate/app/app_controller.dart';
import 'package:flutter_boilerplate/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'commons/presentation/routes.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory(
      (i) => AppController(),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Routes.HOME,
      module: HomeModule(),
    ),
  ];
}
