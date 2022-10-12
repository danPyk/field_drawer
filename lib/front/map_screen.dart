import 'package:field_drawer/domain/map_screen_vm.dart';
import 'package:field_drawer/front/animated_fab.dart';
import 'package:field_drawer/app/injection.dart';
import 'package:field_drawer/models/entry.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

import '../app/constans.dart';

//todo add screen when user is offline
class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MapScreenVm>.reactive(
        viewModelBuilder: () => getIt(),
        onModelReady: (model) async {
          Entry asset = await model.getEntry(Constants.jsonPath);
          model.coordinates = await entryToLatLng(asset);
          model.extractedCords = model.coordinates;
          model.constructPolygon();
        },
        builder: (context, viewModel, child) => Scaffold(
              floatingActionButton: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.05),
                child: FancyFab(
                  duration: const Duration(microseconds: 500),
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
