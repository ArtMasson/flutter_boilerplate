import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/config/ui/theme/ui/stores/theme_store.dart';
import 'package:flutter_boilerplate/app/home/ui/pages/home_page.dart';
import 'package:flutter_boilerplate/common/injected/module.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  final ThemeStore _themeStore = getIt.get<ThemeStore>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeStore>(
          create: (_) => _themeStore..getTheme(),
        ),
      ],
      child: Consumer<ThemeStore>(
        builder: (_, ThemeStore value, __) => Observer(
          builder: (_) => MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: generateRoutes,
            theme: value.theme,
            initialRoute: '/',
          ),
        ),
      ),
    );
  }
}

Route generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => HomePage());
    default:
      return MaterialPageRoute(builder: (_) => HomePage());
  }
}
