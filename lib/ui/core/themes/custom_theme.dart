import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_mvvm/ui/core/themes/text_styles.dart';
import 'package:flutter_shopping_cart_mvvm/utils/constants/colors.dart';
import 'package:flutter_shopping_cart_mvvm/utils/constants/sizes.dart';

abstract class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: surfaceColor,
      secondary: secondaryColor,
      onSecondary: surfaceColor,
      tertiary: buttonColor,
      surface: surfaceColor,
      onSurface: onSurfaceColor,
      error: errorColor,
      onError: surfaceColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        foregroundColor: surfaceColor,
        textStyle: TextStyles.mediumBold,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
      ),
    ),
    cardTheme: CardThemeData(
      color: surfaceColor,
      elevation: defaultElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: surfaceColor,
      centerTitle: true,
      titleTextStyle: TextStyles.largeBoldTitleAppBar,
      elevation: defaultElevation,
    ),
  );
}
