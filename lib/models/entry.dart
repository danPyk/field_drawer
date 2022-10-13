import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:equatable/equatable.dart';
import 'crop_history.dart';
import 'package:json_annotation/json_annotation.dart';

part 'entry.g.dart';

@JsonSerializable()
class Entry extends Equatable {
  final int id;
  final int user;
  final String name;
  final String comment;
  final String geom;
  @JsonKey(name: 'crop_history')
  final List<CropHistory?> cropHistory;
  @JsonKey(name: 'area_ag')
  final double areaAg;
  final String status;
  final double hectares;
  final double area;
  final String created;

  const Entry({
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

  factory Entry.sample() => Entry(
      id: 0,
      user: 0,
      name: '',
      comment: '',
      geom:
          'SRID=4326;POLYGON (( 16.39832562876689 53.20127189893238, 16.40253923092308 53.20217871837988, 16.40288841903603 53.20189538700109, 16.40298368271118 53.20182868828668, 16.39832562876689 53.20127189893238))',
      cropHistory: List.of([CropHistory.sample()]),
      areaAg: 0.0,
      status: '',
      hectares: 0.0,
      area: 0.0,
      created: '');

  Map<String, dynamic> toJson() => _$EntryToJson(this);

  @override
  List<Object> get props => [name];
}

///extract geom field
List<LatLng> entryToLatLng(Entry geom)  {
  String wkt = geom.geom;
  String cutString = wkt.substring(20, wkt.length);

  String strinWithoutLeftBracket = cutString.replaceAll(RegExp(r'[()]'), '');

  List<String> splitList = strinWithoutLeftBracket.split(',');
  List<LatLng> pointsList = [];

  for (var element in splitList) {
    List<String> longLangList = element.split(' ');

    String longString = longLangList[1];
    String latiString = longLangList[2];
    double longDouble = 0.0;
    double latiDouble = 0.0;
    try {
      longDouble = double.parse(longString);
      latiDouble = double.parse(latiString);
    } on FormatException catch (e) {
      var logger = Logger();
      logger.e(e);
    }

    LatLng latLang = LatLng(latiDouble, longDouble);
    pointsList.add(latLang);
  }
  return pointsList;
}
