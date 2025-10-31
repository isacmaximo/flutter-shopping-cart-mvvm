import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/utils/constants/colors.dart';
import 'package:flutter_shopping_cart_mvvm/utils/constants/sizes.dart';

abstract class TextStyles {
  static TextStyle smallTLight = TextStyle(
    fontSize: smallFontSize,
    fontWeight: FontWeight.w300,
    color: onSurfaceColor,
  );
  static TextStyle smallRegular = TextStyle(
    fontSize: smallFontSize,
    fontWeight: FontWeight.w400,
    color: onSurfaceColor,
  );
  static TextStyle smallBold = TextStyle(
    fontSize: smallFontSize,
    fontWeight: FontWeight.w700,
    color: onSurfaceColor,
  );
  static TextStyle mediumLight = TextStyle(
    fontSize: mediumFontSize,
    fontWeight: FontWeight.w300,
    color: onSurfaceColor,
  );

  static TextStyle mediumLightError = TextStyle(
    fontSize: mediumFontSize,
    fontWeight: FontWeight.w300,
    color: errorColor,
  );

  static TextStyle mediumRegular = TextStyle(
    fontSize: mediumFontSize,
    fontWeight: FontWeight.w500,
    color: onSurfaceColor,
  );
  static TextStyle mediumBold = TextStyle(
    fontSize: mediumFontSize,
    fontWeight: FontWeight.w700,
    color: onSurfaceColor,
  );
  static TextStyle largeLight = TextStyle(
    fontSize: largeFontSize,
    fontWeight: FontWeight.w300,
    color: onSurfaceColor,
  );
  static TextStyle largeRegular = TextStyle(
    fontSize: largeFontSize,
    fontWeight: FontWeight.w500,
    color: onSurfaceColor,
  );
  static TextStyle largeRegularPrice = TextStyle(
    fontSize: largeFontSize,
    fontWeight: FontWeight.w500,
    color: secondaryColor,
  );
  static TextStyle largeBold = TextStyle(
    fontSize: largeFontSize,
    fontWeight: FontWeight.w700,
    color: onSurfaceColor,
  );
  static TextStyle largeBoldTitleAppBar = TextStyle(
    fontSize: largeFontSize,
    fontWeight: FontWeight.w700,
    color: surfaceColor,
  );
}
