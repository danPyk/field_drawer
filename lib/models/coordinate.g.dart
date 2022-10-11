// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coordinate _$CoordinateFromJson(Map<String, dynamic> json) => Coordinate(
      longitude: (json['longtitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordinateToJson(Coordinate instance) =>
    <String, dynamic>{
      'longtitude': instance.longitude,
      'latitude': instance.latitude,
    };
