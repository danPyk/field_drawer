import 'dart:async';
import 'dart:collection';

import 'package:field_drawer/models/entry.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<MapScreenVm>()])
class MapScreenVm extends ChangeNotifier {
  bool filledRectangle = true;

  ///coordinates
  late List<LatLng> coordinates;
  List<LatLng> savedCords = [];
  final List<LatLng> _singleCoordinate = [
    const LatLng(16.39832562876689, 53.20127189893238)
  ];

  ///map
  Completer<GoogleMapController> controller = Completer();
  Set<Polygon> polygon = HashSet<Polygon>();
  final CameraPosition camPosition = const CameraPosition(
    target: LatLng(53.20127189893238, 16.39832562876689),
    zoom: 14,
  );

  Future<String> getAssetString(String asset) async {
    return await rootBundle.loadString(asset);
  }

  void _toggleFab() {
    filledRectangle = !filledRectangle;
  }

  void constructPolygon() {
    polygon.add(Polygon(
      polygonId: const PolygonId('1'),
      points: coordinates,
      fillColor: Colors.green.withOpacity(0.3),
      strokeColor: Colors.green,
      geodesic: true,
      strokeWidth: 4,
    ));

    notifyListeners();
  }

  void toggleLayer() {
    _toggleFab();
    if (filledRectangle == false) {
      coordinates = _singleCoordinate;
    }
    if (filledRectangle == true) {
      coordinates = savedCords;
    }
    polygon.clear();

    constructPolygon();
  }

  Future<Entry> getEntry(String asset) async {
    var wkt = await getAssetString(asset);
    Map<String, dynamic> jsonDecoded = json.decode(wkt);

    Entry geom = Entry.fromJson(jsonDecoded);

    return geom;
  }
}
