// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Crop _$CropFromJson(Map<String, dynamic> json) => Crop(
      id: json['id'] as int,
      name: json['name'] as String,
      color: json['color'] as String,
      gddTbase: (json['gdd_tbase'] as num).toDouble(),
      gddTut: (json['gdd_tut'] as num).toDouble(),
    );

Map<String, dynamic> _$CropToJson(Crop instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'gdd_tbase': instance.gddTbase,
      'gdd_tut': instance.gddTut,
    };
