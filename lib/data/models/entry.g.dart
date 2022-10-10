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
      cropHistory: (json['cropHistory'] as List<dynamic>)
          .map((e) => CropHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      areaAg: (json['areaAg'] as num).toDouble(),
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
      'cropHistory': instance.cropHistory,
      'areaAg': instance.areaAg,
      'status': instance.status,
      'hectares': instance.hectares,
      'area': instance.area,
      'created': instance.created,
    };
