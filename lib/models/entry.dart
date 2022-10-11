import 'crop_history.dart';
import 'package:json_annotation/json_annotation.dart';

part 'entry.g.dart';

@JsonSerializable()
class Entry {
  final int id;
  final int user;
  final String name;
  final String comment;
  final String geom;
  final List<CropHistory> cropHistory;
  final double areaAg;
  final String status;
  final double hectares;
  final double area;
  final String created;

  Entry({
    required this.id,
    required this.user,
    required this.name,
    required this.comment,
    required this.geom,
    required this.cropHistory,
    required this.areaAg,
    required this.status,
    required this.hectares,
    required this.area,
    required this.created,
  });

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);

  Map<String, dynamic> toJson() => _$EntryToJson(this);
}
