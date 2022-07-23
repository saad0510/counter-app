import 'package:flutter/widgets.dart';

class Sizes {
  Sizes._();

  static EdgeInsets padding(BuildContext context) => MediaQuery.of(context).padding;

  static bool isMobile(BuildContext context) => adaptiveDeviceWidth(context) < 600;

  static bool isTablet(BuildContext context) => adaptiveDeviceWidth(context) >= 600;

  static bool isPortrait(BuildContext context) => MediaQuery.of(context).orientation == Orientation.portrait;

  static bool isLandscape(BuildContext context) => !isPortrait(context);

  static double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;

  static double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static double deviceSP(BuildContext context) => deviceWidth(context) / 3;

  static double adaptiveDeviceHeight(BuildContext context) =>
      isPortrait(context) ? deviceHeight(context) : deviceWidth(context);

  static double adaptiveDeviceWidth(BuildContext context) =>
      isPortrait(context) ? deviceWidth(context) : deviceHeight(context);

  static double adaptiveDeviceSP(BuildContext context) => adaptiveDeviceWidth(context) / 3;
}
