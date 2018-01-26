import 'package:flutter/material.dart';

class PillButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final Color highlightColor;
  final Color splashColor;
  final Color disabledColor;
  final double elevation;
  final double highlightElevation;
  final double disabledElevation;
  final Brightness colorBrightness;
  final Widget child;
  final bool enabled;

  PillButton({
    this.onPressed,
    this.color,
    this.highlightColor,
    this.splashColor,
    this.disabledColor,
    this.elevation = 2.0,
    this.highlightElevation = 8.0,
    this.disabledElevation = 0.0,
    this.colorBrightness,
    this.child,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return new Material(
      borderRadius: new BorderRadius.circular(30.0),
      elevation: enabled ? elevation : disabledElevation,
      child: new RaisedButton(
        onPressed: enabled ? onPressed : null,
        color: color,
        highlightColor: highlightColor,
        splashColor: splashColor,
        disabledColor: disabledColor,
        highlightElevation: highlightElevation,
        colorBrightness: colorBrightness,
        child: child,
      ),
    );
  }
}