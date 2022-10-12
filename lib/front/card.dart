import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VuiArtistCard extends HookWidget {
  const VuiArtistCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationController =
        useAnimationController(duration: const Duration(milliseconds: 500));
    final scaleAnimation =
        Tween<double>(begin: 0.9, end: 1).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0, 0.5, curve: Curves.easeOut),
    ));
    final translateAnimation =
        Tween<Offset>(begin: const Offset(0, -10), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0, 0.5, curve: Curves.easeOut),
      ),
    );

    animationController.forward();

    return SizedBox(
      height: 100,
      width: 100,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Column(
            children: [
              Transform.scale(
                scale: scaleAnimation.value,
                child: Transform.translate(
                    offset: translateAnimation.value,
                    child: FloatingActionButton(
                      onPressed: () => {null},
                    )),
              ),
            ],
          );
        },
      ),
    );
  }
}
