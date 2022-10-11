
import 'crop_history.dart';
import 'package:json_annotation/json_annotation.dart';
part 'crop.g.dart';

@JsonSerializable()
class Crop {

  final int id;
  final String name;
  final String color;
  final double gddTbase;
  final  double gddTut;

  Crop({
     required this.id,
    required this.name,
    required this.color,
    required this.gddTbase,
    required this.gddTut,});

 factory Crop.fromJson(Map<String, dynamic> json) => _$CropFromJson(json);


  Map<String, dynamic> toJson() =>  _$CropToJson(this);

}