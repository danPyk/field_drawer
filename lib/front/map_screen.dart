import 'dart:async';

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
        onModelReady: (model) async{
         model.points = await model.parseWkt();
         model.constructPolygon();

        },
        builder: (context, viewModel, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF0F9D58),
            // title of app
            title: Text("GFG"),
          ),
          body: Container(
            child: SafeArea(
              child: GoogleMap(
                //given camera position
                initialCameraPosition: viewModel.kGoogle,
                // on below line we have given map type
                mapType: MapType.normal,
                // on below line we have enabled location
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                // on below line we have enabled compass location
                compassEnabled: true,
                // on below line we have added polygon
                polygons: viewModel.polygon,
                // displayed google map
                onMapCreated: (GoogleMapController controller)async{
                   viewModel.controller.complete(controller);
                },
              ),
            ),
          ),
        ));
  }
}
