// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_label.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageLabel _$ImageLabelFromJson(Map<String, dynamic> json) {
  return ImageLabel(
      text: json['text'] as String,
      confidence: (json['confidence'] as num)?.toDouble());
}

Map<String, dynamic> _$ImageLabelToJson(ImageLabel instance) =>
    <String, dynamic>{'text': instance.text, 'confidence': instance.confidence};
