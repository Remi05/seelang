import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seelang/pages/home.dart';
import 'package:seelang/pages/login.dart';
import 'package:seelang/services/auth_service.dart';
import 'package:seelang/services/firebase_auth_service.dart';
import 'package:seelang/utils/routes.dart';

void main() {
  var authService = new FirebaseAuthService();
  runApp(new SeeLangApp(authService));
}

class SeeLangApp extends StatelessWidget {
  final AuthService _authService;

  SeeLangApp(this._authService);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SeeLang',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.white,
        buttonColor: Colors.blue,
      ),
      home: new LoginPage(_authService),
      routes: <String, WidgetBuilder> {
        Routes.Login: (BuildContext context) => new LoginPage(_authService),
        Routes.Home: (BuildContext context) => new HomePage(),
      },
    );
  }
}
