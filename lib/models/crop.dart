import 'package:json_annotation/json_annotation.dart';
part 'crop.g.dart';

@JsonSerializable()
class Crop {
  final int id;
  final String name;
  final String color;
  @JsonKey(name: 'gdd_tbase')
  final double gddTbase;
  @JsonKey(name: 'gdd_tut')
  final double gddTut;

  Crop({
    required this.id,
    required this.name,
    required this.color,
    required this.gddTbase,
    required this.gddTut,
  });

  factory Crop.fromJson(Map<String, dynamic> json) => _$CropFromJson(json);

  factory Crop.sample() =>
      Crop(id: 0, name: '', color: '', gddTbase: 0.0, gddTut: 0.0);

  Map<String, dynamic> toJson() => _$CropToJson(this);
}
