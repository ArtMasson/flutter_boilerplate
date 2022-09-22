import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/app_module.dart';
import 'package:flutter_boilerplate/app/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ),
  );
}
