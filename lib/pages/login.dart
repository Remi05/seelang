import 'dart:async';
import 'package:flutter/material.dart';
import 'package:seelang/components/login_form.dart';
import 'package:seelang/services/auth.service.dart';
import 'package:seelang/utils/routes.dart';

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
    var user = await _authService.login(email, password);
    bool loginSuccess = user != null;
    setState(() {
      _signInFeedbackMessage = !loginSuccess ? 'Login failed' : '';
    });
    if (loginSuccess) {
      Navigator.of(context).pushNamed(Routes.Captures);
    }
  }

  Future<Null> _signInWithGoogle() async {

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