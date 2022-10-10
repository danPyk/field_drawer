// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CropHistory _$CropHistoryFromJson(Map<String, dynamic> json) => CropHistory(
      id: json['id'] as int,
      crop: Crop.fromJson(json['crop'] as Map<String, dynamic>),
      label: json['label'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      yields: (json['yields'] as num).toDouble(),
      yieldsForecast: (json['yieldsForecast'] as num).toDouble(),
    );

Map<String, dynamic> _$CropHistoryToJson(CropHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'crop': instance.crop,
      'label': instance.label,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'yields': instance.yields,
      'yieldsForecast': instance.yieldsForecast,
    };
