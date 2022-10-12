// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CropHistory _$CropHistoryFromJson(Map<String, dynamic> json) => CropHistory(
      id: json['id'] as int,
      crop: Crop.fromJson(json['crop'] as Map<String, dynamic>),
      label: json['label'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      yields: (json['yields'] as num).toDouble(),
      yieldsForecast: (json['yields_forecast'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CropHistoryToJson(CropHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'crop': instance.crop,
      'label': instance.label,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'yields': instance.yields,
      'yields_forecast': instance.yieldsForecast,
    };
