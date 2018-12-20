import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:seelang/services/camera_service.dart';

class BasicCameraService implements CameraService {
  List<CameraDescription> _cameras;
  CameraController _controller;
  String _appDataPath;
  Future<void> _cameraInitializationTask;

  BasicCameraService() {
    _cameraInitializationTask = initialize();
  }

  Future<void> initialize() async {
    Directory appDataDirectory = await getApplicationDocumentsDirectory();
    _appDataPath = appDataDirectory.path;
    _cameras = await availableCameras();
    _controller = CameraController(_cameras[0], ResolutionPreset.medium);
    await _controller.initialize();
  }

  Future<File> takePicture() async { 
    if (_controller == null || !_controller.value.isInitialized) {
      await _cameraInitializationTask;
    }  
    String fileName = '${DateTime.now().toString()}.jpg';
    String filePath = '$_appDataPath/$fileName}';
    await _controller.takePicture(filePath);
    return File(filePath);
  }

  Stream<Widget> _getCameraPreviewStream() async* {
    if (_controller == null || !_controller.value.isInitialized) {
      yield Container();
      await _cameraInitializationTask;
    }  
    yield CameraPreview(_controller);
  }

  Widget getCameraPreview() {
    return StreamBuilder<Widget>(
      stream: _getCameraPreviewStream(),
      initialData: Container(),
      builder: (BuildContext context, AsyncSnapshot<Widget> snapshot){
        return snapshot.data;
      },
    );
  }
}