import 'package:bitsgap/src/constants/text_theme_constants.dart';
import 'package:bitsgap/src/constants/theme_constants.dart';
import 'package:flutter/material.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kBackgroundColor,
    iconTheme: const IconThemeData(color: kForeground),
    textTheme:  ttNormsProTextTheme.apply(bodyColor: kForeground),
    colorScheme: const ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    )
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
      primaryColor: kDarkPrimaryColor,
      scaffoldBackgroundColor: kDarkBackgroundColor,
      iconTheme: const IconThemeData(color: kDarkForeground),
      textTheme:  ttNormsProTextTheme.apply(bodyColor: kDarkForeground),
      colorScheme: const ColorScheme.light(
        primary: kDarkPrimaryColor,
        secondary: kDarkSecondaryColor,
        error: kErrorColor,
      )
  );
}