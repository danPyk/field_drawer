// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Crop _$CropFromJson(Map<String, dynamic> json) => Crop(
      id: json['id'] as int,
      name: json['name'] as String,
      color: json['color'] as String,
      gddTbase: (json['gddTbase'] as num).toDouble(),
      gddTut: (json['gddTut'] as num).toDouble(),
    );

Map<String, dynamic> _$CropToJson(Crop instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'gddTbase': instance.gddTbase,
      'gddTut': instance.gddTut,
    };
