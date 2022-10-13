import 'package:field_drawer/app/injection.dart';
import 'package:field_drawer/domain/welcome_screen_vm.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeScreenVm>.reactive(
        viewModelBuilder: () => sL(),
        onModelReady: (model) async {
          model.internetConnectionSnackbar();
          model.checkLocationPermission();
        },
        builder: (context, viewModel, child) => Scaffold(
              appBar: AppBar(
                title: const Text('Welcome'),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: OutlinedButton(
                      key: Key('o1'),
                      onPressed: () => {
                        viewModel.internetConnectionSnackbar(),
                        viewModel.checkLocationPermission(),
                      },
                      child: const Text('Reload page'),
                    ),
                  ),
                ],
              ),
            ));
  }
}
