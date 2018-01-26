import 'package:flutter/material.dart';
import 'package:seelang/pages/login.dart';
import 'package:seelang/services/auth.service.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
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
    );
  }
}
