// import 'dart:async';
// import 'dart:collection';
//
// import 'package:injectable/injectable.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:logger/logger.dart';
//
// abstract class GMapsServiceI {
//   void onMapCreated(Completer<GoogleMapController> controller);
// }
//
// @singleton
// class GMapsService implements GMapsServiceI {
//   Completer<GoogleMapController> mapController = Completer();
//
//
//
//
//   @override
//   void onMapCreated(Completer<GoogleMapController>? controller) async {
//     try {
//       controller = mapController;
//     } catch (e) {
//       var logger = Logger();
//       logger.d(e);
//     }
//   }
//
// // final GMAPS gmaps;
// // GMapsService({required this.gmaps});
//
// }
