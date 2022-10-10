import 'package:field_drawer/data/front/map_screen_vm.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using the reactive constructor gives you the traditional ViewModel
    // binding which will execute the builder again when notifyListeners is called.
    return ViewModelBuilder<MapScreenVm>.reactive(
        viewModelBuilder: () => MapScreenVm(),
        //onModelReady: (viewModel) => viewModel.initialise(),
        builder: (context, viewModel, child) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
              ),
              body: Column(
                children: [


                ],
              ),
            ));
  }
}
