import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:seelang/models/image_label.dart';
import 'package:seelang/services/vision_service.dart';

class FirebaseVisionService implements VisionService {
  final LabelDetector labelDetector = FirebaseVision.instance.labelDetector();

  Future<List<ImageLabel>> getLabels(File image) async {
    var visionImage = FirebaseVisionImage.fromFile(image);
    List<Label> labels = await labelDetector.detectInImage(visionImage);
    return labels.map((Label label) => new ImageLabel(text: label.label, confidence: label.confidence)).toList();
  }
}