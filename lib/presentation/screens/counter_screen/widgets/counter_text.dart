import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/durations.dart';
import '../../../../logic/cubit/counter_cubit.dart';

class CounterText extends StatefulWidget {
  const CounterText({Key? key, this.fontSize = 80}) : super(key: key);

  final double fontSize;

  @override
  State<CounterText> createState() => _CounterTextState();
}

class _CounterTextState extends State<CounterText> {
  AnimationController? animationController;

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int counter = context.select<CounterCubit, int>(
      (counter) => counter.state.counterValue,
    );
    animationController?.forward(from: 0.0);

    return ZoomIn(
      duration: Durations.quick,
      controller: (c) => animationController = c,
      child: Text(
        counter.toString(),
        style: Theme.of(context).textTheme.headline1?.copyWith(
              fontSize: widget.fontSize,
            ),
      ),
    );
  }
}
