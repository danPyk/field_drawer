import 'package:field_drawer/domain/map_screen_vm.dart';
import 'package:field_drawer/models/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MapScreenVm mapScreenVm = MapScreenVm();

  group('domain/map_screen_vm', () {
    // test('constructPolygon() adding polygon', () {
    //
    //   var result = mapScreenVm.constructPolygon();
    //   expect(actual, matcher)
    // });
    //

    test('getEntry() convert json to entry', () async {
      Entry entry = Entry.sample();
      var result = await mapScreenVm.getEntry('assets/entries/entry_test.json');

      expect(result.props, entry.props);
    });
  });
}
