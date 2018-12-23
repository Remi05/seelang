import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BackgroundIcon extends StatelessWidget {
  final IconData icon;
  final String text;

  BackgroundIcon({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(icon,
          size: 240.0,
          color: new Color.fromARGB(0xFF, 0xCC, 0xCC, 0xCC),
        ),
        new Text(text,
            style: new TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w900,
              color: new Color.fromARGB(0xFF, 0xCC, 0xCC, 0xCC),
            ),
        ),
      ],
    );
  }
}