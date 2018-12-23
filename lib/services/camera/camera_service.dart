import 'dart:io';
import 'package:flutter/material.dart';

abstract class CameraService {
  Future<File> takePicture();
  Widget getCameraPreview();
}