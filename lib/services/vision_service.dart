import 'dart:io';
import 'package:seelang/models/image_label.dart';

abstract class VisionService {
  Future<List<ImageLabel>> getLabels(File image);
}