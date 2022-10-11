import 'dart:async';

import 'package:field_drawer/front/animated_fab.dart';
import 'package:field_drawer/front/map_screen_vm.dart';
import 'package:field_drawer/injection.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

//todo add screen when user is offline
class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using the reactive constructor gives you the traditional ViewModel
    // binding which will execute the builder again when notifyListeners is called.
    return ViewModelBuilder<MapScreenVm>.reactive(
        viewModelBuilder: () => MapScreenVm(gMapsServiceI: getIt()),
        onModelReady: (model) async {
          model.points = await model.parseWkt();
          model.extractedCords = model.points;

          model.constructPolygon();
        },
        builder: (context, viewModel, child) => Scaffold(
              floatingActionButton: Padding(
                padding:  EdgeInsets.only(bottom:
                    MediaQuery.of(context).size.height * 0.05),
                child: FancyFab(
                  duration: Duration(microseconds: 500),
                 ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.startDocked,
              appBar: AppBar(
                backgroundColor: const Color(0xFF0F9D58),
                // title of app
                title: const Text("Field drawer"),
              ),
              body: Container(
                child: SafeArea(
                  child: GoogleMap(
                    //given camera position
                    initialCameraPosition: viewModel.camPosition,
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    compassEnabled: true,
                    polygons: viewModel.polygon,
                    onMapCreated: (GoogleMapController controller) async {
                      viewModel.controller.complete(controller);
                    },
                  ),
                ),
              ),
            ));
  }
}
