import 'package:field_drawer/front/map_screen_vm.dart';
import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FancyFab extends HookViewModelWidget<MapScreenVm> {
  // final Function() onPressed;
  // final String tooltip;
  // final IconData icon;

  final Duration duration;


  final Curve _curve = Curves.easeOut;
  final double _fabHeight = 56.0;

  FancyFab({super.key, required this.duration});

  @override
  Widget buildViewModelWidget(BuildContext context, MapScreenVm viewModel) {

     AnimationController controller = useAnimationController(duration: duration);

    late final Animation<Color?> _buttonColor = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));



    late final Animation<double> _animateIcon =
    Tween<double>(begin: 0.0, end: 1.0).animate(controller);

    // ignore: prefer_final_fields
    late Animation<double> _translateButton = Tween<double>(
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


    animate() {
      if (!viewModel.showFabList) {
        controller.forward();
      } else {
        controller.reverse();
      }
    }

    toogle(){
      return FloatingActionButton(
        backgroundColor: _buttonColor.value,
        onPressed: () {
          animate();
          viewModel.toogleShowFabList();
        },
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.close_menu,
          progress: _animateIcon,
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        // Transform(
        //   transform: Matrix4.translationValues(
        //     0.0,
        //     _translateButton.value,
        //     0.0,
        //   ),
        //   child: const FloatingActionButton(
        //     onPressed: null,
        //     tooltip: 'Inbox',
        //     child: Icon(Icons.rectangle),
        //   ),
        // ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: const FloatingActionButton(
            onPressed: null,
            tooltip: 'Inbox',
            child: Icon(Icons.rectangle_outlined),
          ),
        ),
        toogle(),
      ],
    );
  }
}
