import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double _screenWidth;
  static double _screenHeight;
  static double _blockSizeHorizontal;
  static double _blockSizeVertical;

  static double _safeAreaHorizonzal;
  static double _safeAreaVertical;
  static double safeWidthMultiplier;
  static double safeHeightMultiplier;

  static double textMultiplier;
  static double widthMultiplier;
  static double heightMultiplier;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;

    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;

    _safeAreaHorizonzal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    safeWidthMultiplier = (_screenWidth - _safeAreaHorizonzal) / 100;
    safeHeightMultiplier = (_screenHeight - _safeAreaVertical) / 100;

    textMultiplier = _blockSizeVertical;
    widthMultiplier = _blockSizeHorizontal;
    heightMultiplier = _blockSizeVertical;
  }
}