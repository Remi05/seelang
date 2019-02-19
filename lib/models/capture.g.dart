// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Capture _$CaptureFromJson(Map<String, dynamic> json) {
  return Capture(
      imageUrl: json['imageUrl'] as String,
      labels: (json['labels'] as List)
          ?.map((e) =>
              e == null ? null : ImageLabel.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CaptureToJson(Capture instance) =>
    <String, dynamic>{'imageUrl': instance.imageUrl, 'labels': instance.labels};
