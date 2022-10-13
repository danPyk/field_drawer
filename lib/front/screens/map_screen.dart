import 'package:field_drawer/app/constans.dart';
import 'package:field_drawer/domain/map_screen_vm.dart';
import 'package:field_drawer/app/injection.dart';
import 'package:field_drawer/models/entry.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MapScreenVm>.reactive(
        viewModelBuilder: () => sL(),
        onModelReady: (model) async {
          Entry asset = await model.getEntry(Constants.jsonPath);

          model.coordinates = entryToLatLng(asset);
          model.savedCords = model.coordinates;
          model.constructPolygon();
        },
        builder: (context, viewModel, child) => Scaffold(
              floatingActionButton: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.05),
                child: FloatingActionButton(
                  key: Key('fab'),
                  backgroundColor: Colors.green,
                  onPressed: () {
                    viewModel.toggleLayer();
                  },
                  child: viewModel.filledRectangle == true
                      ? const Icon(Icons.rectangle_outlined)
                      : const Icon(Icons.rectangle),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.startDocked,
              appBar: AppBar(
                ///hide back arrow
                automaticallyImplyLeading: false,
                backgroundColor: const Color(0xFF0F9D58),
                // title of app
                title: const Text("Field drawer"),
              ),
              body: SafeArea(
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
            ));
  }
}
