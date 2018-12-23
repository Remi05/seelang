import 'dart:io';
import 'package:flutter/material.dart';
import 'package:seelang/services/camera/camera_service.dart';
import 'package:seelang/services/camera/basic_camera_service.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final CameraService _cameraService = new BasicCameraService();
  File _image;

  void takePicture() async {
    File image = await _cameraService.takePicture();
    setState(() => _image = image);
  }

  Widget _capturePreview() {
    if (_image != null) {
      return Image.file(_image);
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _cameraService.getCameraPreview(),
        Align(
          alignment: Alignment.bottomCenter,
          child: RaisedButton(
            onPressed: takePicture,
            child: Text('Take Picture'),
          ),
        )
      ],
    );
  }
}