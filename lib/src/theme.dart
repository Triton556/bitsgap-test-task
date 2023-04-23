import 'package:bitsgap/src/constants/text_theme_constants.dart';
import 'package:bitsgap/src/constants/theme_constants.dart';
import 'package:flutter/material.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kBackgroundColor,
    iconTheme: const IconThemeData(color: kForeground),
    textTheme: ttNormsProTextTheme.apply(bodyColor: kForeground),
    colorScheme: const ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
      surface: kBackgroundColor
    ),
    tabBarTheme: const TabBarTheme(
      indicatorColor: kPrimaryColor,
      unselectedLabelColor: kForeground
    ),
    focusColor: kForeground,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kBordersColor),
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kPrimaryColor),
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kDarkBackgroundColor,
    iconTheme: const IconThemeData(color: kDarkForeground),
    textTheme: ttNormsProTextTheme.apply(bodyColor: kDarkForeground),
    colorScheme: const ColorScheme.dark(
      primary: kPrimaryColor,
      secondary: kDarkSecondaryColor,
      error: kErrorColor,
      surface: kDarkBackgroundColor
    ),
    tabBarTheme: const TabBarTheme(
        indicatorColor: kPrimaryColor,
        unselectedLabelColor: kDarkForeground
    ),
    focusColor: kDarkForeground,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kDarkBordersColor),
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kPrimaryColor),
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
    ),
  );
}
