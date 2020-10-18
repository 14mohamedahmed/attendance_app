import 'package:flutter/material.dart';

class AppConfig {
  static MediaQueryData _mediaQueryData;
  static var _orientation;
  static double screenWidth;
  static double screenHeight;
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _orientation = MediaQuery.of(context).orientation;
    // screen width changeing height and width if device portrait and landscape.
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    // we don't need this change because using it for font size and padding and need it the same in diffrent devices.
    safeBlockHorizontal = _orientation == Orientation.portrait
        ? (screenWidth - _safeAreaHorizontal) / 100
        : (screenHeight - _safeAreaVertical) / 100;
    safeBlockVertical = _orientation == Orientation.portrait
        ? (screenHeight - _safeAreaVertical) / 100
        : (screenWidth - _safeAreaHorizontal) / 100;
  }
}
