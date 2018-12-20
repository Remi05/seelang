import 'package:flutter/material.dart';
import 'package:seelang/services/camera_service.dart';
import 'package:seelang/services/basic_camera_service.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final CameraService _cameraService = new BasicCameraService();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _cameraService.getCameraPreview(),
        Align(
          alignment: Alignment.bottomCenter,
          child: RaisedButton(
            onPressed: () => _cameraService.takePicture(),
            child: Text('Take Picture'),
          ),
        )
      ],
    );
  }
}