import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/home/ui/pages/home_page.dart';
import 'package:flutter_boilerplate/config/ui/theme/ui/stores/theme_store.dart';
import 'package:flutter_boilerplate/core/common/injected/module.dart';
import 'package:flutter_boilerplate/core/common/utils/screen_utils.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/intl_localizations.dart';

class MyApp extends StatelessWidget {
  final ThemeStore _themeStore = getIt.get<ThemeStore>();

  @override
  Widget build(BuildContext context) {
    //Responsive design
    return Sizer(builder: (
      context,
      orientation,
      deviceType,
    ) {
      //Theme change provider
      return MultiProvider(
        providers: [
          Provider<ThemeStore>(
            create: (_) => _themeStore..getTheme(),
          ),
        ],
        child: Consumer<ThemeStore>(
          builder: (_, ThemeStore value, __) => Observer(
            builder: (_) =>
                //App
                MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: generateRoutes,
              theme: value.theme,
              initialRoute: '/',
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            ),
          ),
        ),
      );
    });
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
