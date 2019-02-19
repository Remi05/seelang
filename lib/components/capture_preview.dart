import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seelang/models/capture.dart';

class CapturePreview extends StatelessWidget {
  final Capture _capture;

  CapturePreview(this._capture);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Image.network(_capture.imageUrl),
        new Text(_capture.labels[0].text),
      ],
    );
  }
}