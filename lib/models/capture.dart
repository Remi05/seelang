import 'package:json_annotation/json_annotation.dart';
import 'package:seelang/models/image_label.dart';

part 'capture.g.dart';

@JsonSerializable()
class Capture {
  final String imageUrl;
  final List<ImageLabel> labels;

  Capture({this.imageUrl, this.labels});

  factory Capture.fromJson(Map<String, dynamic> json) => _$CaptureFromJson(json);

  Map<String, dynamic> toJson() => _$CaptureToJson(this);
}