import 'package:flutter/material.dart';

import '../utils/constants.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  focusColor: Colors.black,
  cardColor: const Color(0xFFF5F6F9),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(foregroundColor: Colors.white),
  dividerColor: Colors.grey.shade200,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "Monstserrat",
  appBarTheme: appBarThemeLight(),
  inputDecorationTheme: inputDecorationTheme(),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
      .copyWith(secondary: Colors.black)
      .copyWith(
        background: const Color(0xFEFEFEFE),
      ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  focusColor: Colors.white,
  cardColor: const Color(0xFF21202B),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(foregroundColor: kTextDarkColor),
  dividerColor: Colors.grey.shade900,
  scaffoldBackgroundColor: const Color(0xFF121212),
  fontFamily: "Monstserrat",
  appBarTheme: appBarThemeDark(),
  inputDecorationTheme: inputDecorationTheme(),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
      .copyWith(secondary: Colors.white, brightness: Brightness.dark)
      .copyWith(
        background: const Color(0xFF0E0E0E),
      ),
);

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide.none,
    gapPadding: 10,
  );
  return InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: kDefaultPadding,
      vertical: kDefaultPadding,
    ),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    errorStyle: const TextStyle(
      height: 0,
      fontSize: 0,
      color: Colors.transparent,
    ),
    filled: true,
    fillColor: const Color(0xFFF5F6F9),
    labelStyle: const TextStyle(color: kTextColor),
    hintStyle: const TextStyle(color: kTextColor),
    border: outlineInputBorder,
  );
}

AppBarTheme appBarThemeLight() {
  return const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    color: Colors.white,
    iconTheme: IconThemeData(color: kTextDarkColor),
    titleTextStyle: TextStyle(
      color: kTextColor,
      fontSize: 18,
    ),
  );
}

AppBarTheme appBarThemeDark() {
  return const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    color: Color(0xFF121212),
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: kTextColor,
      fontSize: 18,
    ),
  );
}
