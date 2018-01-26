import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seelang/components/pill_button.dart';

class GoogleLoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  GoogleLoginButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return new PillButton(
      onPressed: onPressed,
      color: Colors.white,
      elevation: 3.0,
      child: new Padding(
        padding: new EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text('SIGN IN WITH  ',
                style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )
            ),
            new Image.asset('images/google-logo.png', width: 20.0),
          ],
        ),
      ),
    );
  }
}