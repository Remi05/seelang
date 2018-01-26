import 'package:flutter/material.dart';
import 'package:seelang/components/login/google_login_button.dart';
import 'package:seelang/components/pill_button.dart';

typedef void EmailLoginCallback(String email, String password);

class LoginForm extends StatelessWidget {
  final EmailLoginCallback onSignInPressed;
  final VoidCallback onSignInWithGooglePressed;
  final String signInFeedbackMessage;

  final _formKey = new GlobalKey<FormState>();
  String _email;
  String _password;

  LoginForm({
    this.onSignInPressed,
    this.onSignInWithGooglePressed,
    this.signInFeedbackMessage
  });

  void signInWithEmailAndPassword() {
    _formKey.currentState.save();
    onSignInPressed(_email, _password);
  }

  Widget _buildEmailTextField() {
    return new Padding(
      padding: new EdgeInsets.only(bottom: 10.0),
      child: new TextFormField(
        decoration: new InputDecoration(
          labelText: 'Email',
          icon: new Icon(Icons.person_outline),
        ),
        onSaved: (val) => _email = val,
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return new Padding(
      padding: new EdgeInsets.only(bottom: 40.0),
      child: new TextFormField(
        decoration: new InputDecoration(
            labelText: 'Password',
            icon: new Icon(Icons.lock_outline)
        ),
        onSaved: (val) => _password = val,
        obscureText: true,
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return new PillButton(
        onPressed: signInWithEmailAndPassword,
        elevation: 3.0,
        child: new Padding(
          padding: new EdgeInsets.fromLTRB(52.5, 15.0, 52.5, 15.0),
          child: new Text('SIGN IN',
              style: new TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              )
          ),
        )
    );
  }

  Widget _buildSignInWithGoogleButton(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.only(top: 30.0),
      child: new GoogleLoginButton(
        onPressed: onSignInWithGooglePressed,
      ),
    );
  }

  Widget _buildSignInFeedbackWidget() {
    return new Padding(
        padding: new EdgeInsets.only(top: 20.0),
        child: new Text(signInFeedbackMessage,
          style: new TextStyle(color: Colors.red, fontSize: 16.0),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Form(
      key: _formKey,
      child: new Column(
        children: <Widget>[
          _buildEmailTextField(),
          _buildPasswordTextField(),
          _buildSignInButton(context),
          _buildSignInWithGoogleButton(context),
          _buildSignInFeedbackWidget(),
        ],
      )
    );
  }
}