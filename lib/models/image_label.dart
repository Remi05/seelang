import 'package:json_annotation/json_annotation.dart';

part 'image_label.g.dart';

@JsonSerializable()
class ImageLabel {
  final String text;
  final double confidence;

  ImageLabel({this.text, this.confidence});

  factory ImageLabel.fromJson(Map<String, dynamic> json) => _$ImageLabelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageLabelToJson(this);
}