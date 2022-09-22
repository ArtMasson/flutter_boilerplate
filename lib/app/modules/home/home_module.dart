import 'package:flutter_boilerplate/app/modules/home/page/home_controller.dart';
import 'package:flutter_boilerplate/app/modules/home/page/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'page/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => HomeStore(),
    ),
    Bind.factory(
      (i) => HomeController(
        store: i(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => HomePage(),
    ),
  ];
}
