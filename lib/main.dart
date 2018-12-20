import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seelang/pages/home.dart';
import 'package:seelang/pages/login.dart';
import 'package:seelang/services/auth_service.dart';
import 'package:seelang/utils/routes.dart';

void main() {
  runApp(new SeeLangApp());
}

class SeeLangApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SeeLang',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.white,
        buttonColor: Colors.blue,
      ),
      home: new LoginPage(new AuthService()),
      routes: <String, WidgetBuilder> {
        Routes.Login: (BuildContext context) => new LoginPage(new AuthService()),
        Routes.Home: (BuildContext context) => new HomePage(),
      },
    );
  }
}
