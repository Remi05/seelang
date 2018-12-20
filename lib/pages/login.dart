import 'dart:async';
import 'package:flutter/material.dart';
import 'package:seelang/components/login/login_form.dart';
import 'package:seelang/models/user.dart';
import 'package:seelang/services/auth_service.dart';
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

  void _checkLoginState(BuildContext context) {
    setState(() {
      _signInFeedbackMessage = _authService.currentUser == null ? 'Login failed' : '';
    });
    if (_authService.currentUser != null) {
      Navigator.of(context).pushNamed(Routes.Home);
    }
  }

  Future<Null> _signInWithEmailAndPassword(BuildContext context, String email, String password) async {
    User user = await _authService.signInWithEmailAndPassword(email, password);
    _checkLoginState(context);
  }

  Future<Null> _signInWithGoogle(BuildContext context) async {
    User user = await _authService.signInWithGoogle();
    _checkLoginState(context);
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
                onSignInPressed: (email, password) => _signInWithEmailAndPassword(context, email, password),
                onSignInWithGooglePressed: () => _signInWithGoogle(context),
                signInFeedbackMessage: _signInFeedbackMessage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}