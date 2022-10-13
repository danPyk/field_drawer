// Mocks generated by Mockito 5.3.2 from annotations
// in field_drawer/domain/map_screen_vm.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;
import 'dart:ui' as _i6;

import 'package:field_drawer/domain/map_screen_vm.dart' as _i5;
import 'package:field_drawer/models/entry.dart' as _i4;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCompleter_0<T> extends _i1.SmartFake implements _i2.Completer<T> {
  _FakeCompleter_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCameraPosition_1 extends _i1.SmartFake
    implements _i3.CameraPosition {
  _FakeCameraPosition_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEntry_2 extends _i1.SmartFake implements _i4.Entry {
  _FakeEntry_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MapScreenVm].
///
/// See the documentation for Mockito's code generation for more information.
class MockMapScreenVm extends _i1.Mock implements _i5.MapScreenVm {
  @override
  bool get filledRectangle => (super.noSuchMethod(
        Invocation.getter(#filledRectangle),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  set filledRectangle(bool? _filledRectangle) => super.noSuchMethod(
        Invocation.setter(
          #filledRectangle,
          _filledRectangle,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<_i3.LatLng> get coordinates => (super.noSuchMethod(
        Invocation.getter(#coordinates),
        returnValue: <_i3.LatLng>[],
        returnValueForMissingStub: <_i3.LatLng>[],
      ) as List<_i3.LatLng>);
  @override
  set coordinates(List<_i3.LatLng>? _coordinates) => super.noSuchMethod(
        Invocation.setter(
          #coordinates,
          _coordinates,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<_i3.LatLng> get savedCords => (super.noSuchMethod(
        Invocation.getter(#savedCords),
        returnValue: <_i3.LatLng>[],
        returnValueForMissingStub: <_i3.LatLng>[],
      ) as List<_i3.LatLng>);
  @override
  set savedCords(List<_i3.LatLng>? _savedCords) => super.noSuchMethod(
        Invocation.setter(
          #savedCords,
          _savedCords,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.Completer<_i3.GoogleMapController> get controller => (super.noSuchMethod(
        Invocation.getter(#controller),
        returnValue: _FakeCompleter_0<_i3.GoogleMapController>(
          this,
          Invocation.getter(#controller),
        ),
        returnValueForMissingStub: _FakeCompleter_0<_i3.GoogleMapController>(
          this,
          Invocation.getter(#controller),
        ),
      ) as _i2.Completer<_i3.GoogleMapController>);
  @override
  set controller(_i2.Completer<_i3.GoogleMapController>? _controller) =>
      super.noSuchMethod(
        Invocation.setter(
          #controller,
          _controller,
        ),
        returnValueForMissingStub: null,
      );
  @override
  Set<_i3.Polygon> get polygon => (super.noSuchMethod(
        Invocation.getter(#polygon),
        returnValue: <_i3.Polygon>{},
        returnValueForMissingStub: <_i3.Polygon>{},
      ) as Set<_i3.Polygon>);
  @override
  set polygon(Set<_i3.Polygon>? _polygon) => super.noSuchMethod(
        Invocation.setter(
          #polygon,
          _polygon,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.CameraPosition get camPosition => (super.noSuchMethod(
        Invocation.getter(#camPosition),
        returnValue: _FakeCameraPosition_1(
          this,
          Invocation.getter(#camPosition),
        ),
        returnValueForMissingStub: _FakeCameraPosition_1(
          this,
          Invocation.getter(#camPosition),
        ),
      ) as _i3.CameraPosition);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i2.Future<String> getAssetString(String? asset) => (super.noSuchMethod(
        Invocation.method(
          #getAssetString,
          [asset],
        ),
        returnValue: _i2.Future<String>.value(''),
        returnValueForMissingStub: _i2.Future<String>.value(''),
      ) as _i2.Future<String>);
  @override
  void constructPolygon() => super.noSuchMethod(
        Invocation.method(
          #constructPolygon,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void toggleLayer() => super.noSuchMethod(
        Invocation.method(
          #toggleLayer,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.Future<_i4.Entry> getEntry(String? asset) => (super.noSuchMethod(
        Invocation.method(
          #getEntry,
          [asset],
        ),
        returnValue: _i2.Future<_i4.Entry>.value(_FakeEntry_2(
          this,
          Invocation.method(
            #getEntry,
            [asset],
          ),
        )),
        returnValueForMissingStub: _i2.Future<_i4.Entry>.value(_FakeEntry_2(
          this,
          Invocation.method(
            #getEntry,
            [asset],
          ),
        )),
      ) as _i2.Future<_i4.Entry>);
  @override
  void addListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
