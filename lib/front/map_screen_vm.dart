import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:field_drawer/back/datasource/g_maps.dart';
import 'package:field_drawer/models/coordinate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

@injectable
class MapScreenVm extends ChangeNotifier {
  final GMapsServiceI gMapsServiceI;

  MapScreenVm({required this.gMapsServiceI});

  Completer<GoogleMapController> controller = Completer();

  late final List<Coordinate> cords;
  Set<Polygon> polygon = HashSet<Polygon>();
  late List<LatLng> points;

  List<LatLng> emptyPoint = [
    const LatLng(16.39832562876689, 53.20127189893238)
  ];
  List<LatLng> extractedCords = [];

  bool showColorLayer = true;
  bool showFabList = false;

  toogleShowFabList(){
    showFabList = !showFabList;
    notifyListeners();
  }

  final CameraPosition camPosition = const CameraPosition(
    target: LatLng(16.39832562876689, 53.20127189893238),
    zoom: 14,
  );

  Future<String> getAsset() async {
    return await rootBundle.loadString('assets/entries/entry.json');
  }

  void toggleLayer() {
    showColorLayer = !showColorLayer;
    if (showColorLayer != true) {
      points = emptyPoint;
    }
    if (showColorLayer == true) {
      points = extractedCords;
    }
    polygon.clear();

    constructPolygon();
  }

  String printString = '';

  void constructPolygon() {
    polygon.add(Polygon(
      polygonId: const PolygonId('1'),
      points: points,
      fillColor: Colors.green.withOpacity(0.3),
      strokeColor: Colors.green,
      geodesic: true,
      strokeWidth: 4,
    ));

    notifyListeners();
  }

  Future<List<LatLng>> parseWkt() async {
    List<LatLng> pointsList = [];
    var wkt = await getAsset();
    var jsonDecoded = json.decode(wkt);

    String geom = jsonDecoded['geom'];
    String cuttedString = geom.substring(20, geom.length);

    String finalString = cuttedString.replaceAll(RegExp(r'(\)+)'), '');
    String morefiNAL = finalString.replaceAll(RegExp(r'(\(+)'), '');
    List<String> splitList = morefiNAL.split(',');

    for (var element in splitList) {
      List<String> longLangList = element.split(' ');

      String longString = longLangList[1];
      String lingString = longLangList[2];
      var long;
      var lati;
      try {
        long = double.parse(longString);
        lati = double.parse(lingString);
      } on FormatException catch (e) {
        var logger = Logger();
        logger.e(e);
      }

      LatLng latlang = LatLng(long, lati);
      pointsList.add(latlang);
    }
    notifyListeners();
    return pointsList;
  }
}
