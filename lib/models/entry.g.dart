// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entry _$EntryFromJson(Map<String, dynamic> json) => Entry(
      id: json['id'] as int,
      user: json['user'] as int,
      name: json['name'] as String,
      comment: json['comment'] as String,
      geom: json['geom'] as String,
      cropHistory: (json['crop_history'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : CropHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      areaAg: (json['area_ag'] as num).toDouble(),
      status: json['status'] as String,
      hectares: (json['hectares'] as num).toDouble(),
      area: (json['area'] as num).toDouble(),
      created: json['created'] as String,
    );

Map<String, dynamic> _$EntryToJson(Entry instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'name': instance.name,
      'comment': instance.comment,
      'geom': instance.geom,
      'crop_history': instance.cropHistory,
      'area_ag': instance.areaAg,
      'status': instance.status,
      'hectares': instance.hectares,
      'area': instance.area,
      'created': instance.created,
    };
