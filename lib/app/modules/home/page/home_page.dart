import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/modules/home/page/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'home.title'.i18n(),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.green,
      ),
    );
  }
}
