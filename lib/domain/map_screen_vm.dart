import 'dart:async';
import 'dart:collection';

import 'package:field_drawer/models/entry.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

@injectable
class MapScreenVm extends ChangeNotifier {
  bool _showColorLayer = true;
  bool showFabList = false;
  bool isFirstAnimationLaunch = true;

  ///coordinates
  late List<LatLng> coordinates;
  List<LatLng> extractedCords = [];
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

  Future<String> _getAsset(String asset) async {
    return await rootBundle.loadString(asset);
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

  void toggleShowAnimatedFab() {
    showFabList = !showFabList;
    notifyListeners();
  }

  void toggleLayer() {
    _showColorLayer = !_showColorLayer;
    if (_showColorLayer == false) {
      coordinates = _singleCoordinate;
    }
    if (_showColorLayer == true) {
      coordinates = extractedCords;
    }
    polygon.clear();

    constructPolygon();
  }

  Future<Entry> getEntry(String asset) async {
    var wkt = await _getAsset(asset);
    Map<String, dynamic> jsonDecoded = json.decode(wkt);

    Entry geom = Entry.fromJson(jsonDecoded);

    return geom;
  }
}
