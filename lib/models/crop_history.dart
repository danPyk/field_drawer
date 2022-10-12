import 'crop.dart';

import 'package:json_annotation/json_annotation.dart';

part 'crop_history.g.dart';

@JsonSerializable()
class CropHistory {
  final int id;
  final Crop crop;
  final String label;
  @JsonKey(name: 'start_date')
  final String startDate;
  @JsonKey(name: 'end_date')
  final String endDate;
  final double yields;
  @JsonKey(name: 'yields_forecast')
  final double? yieldsForecast;

  CropHistory({
    required this.id,
    required this.crop,
    required this.label,
    required this.startDate,
    required this.endDate,
    required this.yields,
    required this.yieldsForecast,
  });

  factory CropHistory.sample() => CropHistory(
      id: 0,
      crop: Crop.sample(),
      label: '',
      startDate: '2000-00-00',
      endDate: '2000-00-01',
      yields: 0.0,
      yieldsForecast: 0.0);

  factory CropHistory.fromJson(Map<String, dynamic> json) =>
      _$CropHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$CropHistoryToJson(this);
}
