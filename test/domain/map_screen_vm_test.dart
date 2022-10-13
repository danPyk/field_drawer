import 'dart:collection';

import 'package:field_drawer/domain/map_screen_vm.dart';
import 'map_screen_vm.mocks.dart';
import 'package:field_drawer/models/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var mapScreenVm = MapScreenVm();
  var mockMapScreenVm = MockMapScreenVm();

  group('domain/map_screen_vm', () {
    test('void constructPolygon() check if polygon change ', () {
      mapScreenVm.coordinates = [];
      mapScreenVm.constructPolygon();
      expect(mapScreenVm.polygon.isNotEmpty, true);
    });
    test('void constructPolygon() check if polygon didnt change ', () {
      mapScreenVm.coordinates = [];
      mapScreenVm.constructPolygon();
      mapScreenVm.polygon.clear();
      expect(mapScreenVm.polygon.isEmpty, true);
    });

    test('void toggleLayer() check if polygon was cleared ', () {
      Set<Polygon> polygon = HashSet<Polygon>();
      mapScreenVm.toggleLayer();
      expect(polygon.isEmpty, true);
    });

    test('void toggleLayer() check if polygon was not cleared ', () {
      Set<Polygon> polygon = HashSet<Polygon>();
      mapScreenVm.toggleLayer();
      polygon.add(Polygon(polygonId: PolygonId('1')));
      expect(polygon.isEmpty, false);
    });
    test(' getAsset() convert json to String ', () async {
      var asset = await mockMapScreenVm
          .getAssetString('assets/entries/entry_test.json');
      expect(asset.runtimeType, String);
    });
    test(' getAsset() invalid return type ', () async {
      var asset = mapScreenVm.getAssetString('assets/entries/entry_test.json');
      expect(asset, isNot(String));
    });

    test('getEntry() convert json to entry', () async {
      Entry entry = Entry.sample();
      Entry result =
          await mapScreenVm.getEntry('assets/entries/entry_test.json');

      expect(result, entry);
    });
    test('getEntry() convert json to failed', () async {
      Future<Entry> result =
          mapScreenVm.getEntry('assets/entries/entry_test.json');

      expect(result, isNot(Entry));
    });
  });
}
