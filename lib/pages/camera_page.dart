import 'package:flutter/material.dart';
import 'package:seelang/blocs/captures_bloc.dart';

class CameraPage extends StatefulWidget {
  final CapturesBloc _capturesBloc;

  CameraPage(this._capturesBloc);

  @override
  _CameraPageState createState() => _CameraPageState(_capturesBloc);
}

class _CameraPageState extends State<CameraPage> {
  final CapturesBloc _capturesBloc;

  _CameraPageState(this._capturesBloc);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _capturesBloc.getCameraPreview(),
        Align(
          alignment: Alignment.bottomCenter,
          child: RaisedButton(
            onPressed: _capturesBloc.takeCapture,
            child: Text('Take Picture'),
          ),
        )
      ],
    );
  }
}