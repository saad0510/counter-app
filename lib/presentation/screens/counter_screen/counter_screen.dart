import 'package:flutter/material.dart';

import '../../../core/constants/sizes.dart';
import 'widgets/circles_animation.dart';
import 'widgets/counter_slider.dart';
import 'widgets/counter_text.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dh = Sizes.deviceHeight(context);
    final dw = Sizes.deviceWidth(context);
    final adh = Sizes.adaptiveDeviceHeight(context);
    final adw = Sizes.adaptiveDeviceWidth(context);
    final appPadding = Sizes.padding(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: dh - appPadding.top - appPadding.bottom,
            minWidth: dw,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.05 * dh),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CirclesAnimation(height: adh * 0.4),
                    CounterText(fontSize: adw / 3 * 0.4),
                  ],
                ),
                CounterSlider(
                  height: 0.1 * adh,
                  width: Sizes.isTablet(context) ? 0.4 * adw : 0.5 * adw,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
