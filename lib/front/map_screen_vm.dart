import 'dart:async';
import 'dart:collection';
import 'dart:io';
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

  // created list of locations to display polygon
   late List<LatLng> points ;

  // on below line we have set the camera position
  final CameraPosition kGoogle = const CameraPosition(
    target: LatLng(16.39832562876689, 53.20127189893238),
    zoom: 14,
  );

  Future<String> getAsset() async {
    return await rootBundle.loadString('assets/entries/entry.json');
  }

  String printString = '';

  void constructPolygon(){
    polygon.add(
        Polygon(
          // given polygonId
          polygonId: PolygonId('2'),
          // initialize the list of points to display polygon
          points: points,
          // given color to polygon
          fillColor: Colors.green.withOpacity(0.3),
          // given border color to polygon
          strokeColor: Colors.green,
          geodesic: true,
          // given width of border
          strokeWidth: 4,
        )
    );
  }

  // This returns a JSON encoded string of the WKT

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

      LatLng latlang = LatLng(long,lati);
      pointsList.add(latlang);
    }
    notifyListeners();
    return pointsList;
  }



}
