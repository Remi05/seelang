import 'dart:async';
import 'package:flutter/material.dart';
import 'package:seelang/components/login_form.dart';
import 'package:seelang/models/user.dart';
import 'package:seelang/services/auth.service.dart';

class LoginPage extends StatefulWidget {
  final AuthService _authService;

  LoginPage(this._authService, {Key key}) : super(key: key);

  @override
  _LoginPageState createState() => new _LoginPageState(_authService);
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService;
  String _signInFeedbackMessage = '';

  _LoginPageState(this._authService);

  Future<Null> _signInWithEmailAndPassword(String email, String password) async {
    User user = await _authService.signInWithEmailAndPassword(email, password);
    setState(() {
      _signInFeedbackMessage = user == null ? 'Login failed' : 'Hello ${user.displayName}';
    });
  }

  Future<Null> _signInWithGoogle() async {
    User user = await _authService.signInWithGoogle();
    setState(() {
      _signInFeedbackMessage = user == null ? 'Login failed' : 'Hello ${user.displayName}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Image.asset('images/logo.png', width: 200.0),
            new Container(
              width: 340.0,
              margin: new EdgeInsets.fromLTRB(20.0, 10.0, 40.0, 0.0),
              child: new LoginForm(
                onSignInPressed: _signInWithEmailAndPassword,
                onSignInWithGooglePressed: _signInWithGoogle,
                signInFeedbackMessage: _signInFeedbackMessage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}