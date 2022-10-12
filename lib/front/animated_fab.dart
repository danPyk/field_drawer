import 'package:field_drawer/domain/map_screen_vm.dart';
import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FancyFab extends HookViewModelWidget<MapScreenVm> {
  final Duration duration;

  final Curve _curve = Curves.easeOut;
  final double _fabHeight = 56.0;

  FancyFab({super.key, required this.duration});

  late AnimationController controller;

  late final Animation<double> _tweenAnimation = Tween<double>(
    begin: _fabHeight,
    end: -14.0,
  ).animate(CurvedAnimation(
    parent: controller,
    curve: Interval(
      0.0,
      0.75,
      curve: _curve,
    ),
  ));

  @override
  Widget buildViewModelWidget(BuildContext context, MapScreenVm viewModel) {
    controller =
        useAnimationController(duration: const Duration(microseconds: 500));

    animate() {
      if (viewModel.showFabList) {
        controller.forward();
      } else {
        controller.reverse();
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _tweenAnimation.value,
            0.0,
          ),
          child: FloatingActionButton(
            heroTag: '1',
            onPressed: () => viewModel.toggleLayer(),
            tooltip: 'Toggle layer',
            child: const Icon(Icons.rectangle_outlined),
          ),
        ),
        FloatingActionButton(
          heroTag: '2',
          backgroundColor: Colors.green,
          onPressed: () {
            viewModel.toggleShowAnimatedFab();
            animate();
          },
          tooltip: 'Show fab',
          child: viewModel.showFabList == true
              ? const Icon(Icons.rectangle)
              : const Icon(Icons.rectangle_outlined),
        ),
      ],
    );
  }
}
