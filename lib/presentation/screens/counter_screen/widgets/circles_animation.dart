import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';

class CirclesAnimation extends StatelessWidget {
  const CirclesAnimation({Key? key, required this.height}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: FlareActor(
        fit: BoxFit.contain,
        Assets.circlesAnimation,
        animation: "Alarm",
        alignment: Alignment.center,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
