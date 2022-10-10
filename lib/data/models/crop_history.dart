import 'crop.dart';

import 'package:json_annotation/json_annotation.dart';
part 'crop_history.g.dart';

@JsonSerializable()
class CropHistory {

  final int id;
  final Crop crop;
  final  String label;
  final String startDate;
  final String endDate;
  final double yields;
  final double yieldsForecast;


  CropHistory({
    required this.id,
    required this.crop,
    required this.label,
    required this.startDate,
    required this.endDate,
    required this.yields,
    required this.yieldsForecast,});

  factory CropHistory.fromJson(Map<String, dynamic> json) => _$CropHistoryFromJson(json);


  Map<String, dynamic> toJson() => _$CropHistoryToJson(this);


}