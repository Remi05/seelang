import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:seelang/models/capture.dart';
import 'package:seelang/models/image_label.dart';
import 'package:seelang/services/camera/camera_service.dart';
import 'package:seelang/services/database/repository.dart';
import 'package:seelang/services/storage/storage_service.dart';
import 'package:seelang/services/vision/vision_service.dart';

class CapturesBloc {
  final CameraService _cameraService;
  final Repository<Capture> _capturesRepository;
  final StorageService _storageService;
  final VisionService _visionService;
  final StreamController<File> _imagesStreamController = new StreamController<File>();

  Stream<List<Capture>> get capturesStream => Stream.fromFuture(_capturesRepository.all());
  Sink<File> get imagesSink => _imagesStreamController.sink;

  CapturesBloc(this._cameraService, this._capturesRepository, 
              this._storageService, this._visionService) {
      _imagesStreamController.stream.listen(_onImageAdded);
  }

  Future<void> takeCapture() async {
    File image = await _cameraService.takePicture();
    imagesSink.add(image);
  }

  void _onImageAdded(File image) async {
    String imageName = DateTime.now().toString();
    await _storageService.uploadFile(imageName, image);
    List<ImageLabel> labels = await _visionService.getLabels(image);
    String imageUrl = await _storageService.getDownloadUrl(imageName);
    var capture = new Capture(imageUrl: imageUrl, labels: labels);
    await _capturesRepository.add(capture);
  }

  Widget getCameraPreview() {
    return _cameraService.getCameraPreview();
  }
}