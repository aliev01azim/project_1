import 'package:flutter/material.dart';

import 'custom_route.dart';

final ThemeData defaultTheme = _buildDefaultTheme();
ThemeData _buildDefaultTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            letterSpacing: 0.1,
            color: Colors.white),
        elevation: 0.0,
        centerTitle: true,
        textTheme: _buildDefaultTextTheme(),
        backgroundColor: Color.fromRGBO(97, 62, 234, 1),
        iconTheme: IconThemeData(color: Colors.white)),
    primaryColor: Color.fromRGBO(97, 62, 234, 1),
    textTheme: _buildDefaultTextTheme(),
    fontFamily: 'OpenSans',
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.android: CustomPageTransitionBuilder(),
      TargetPlatform.iOS: CustomPageTransitionBuilder(),
    }),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled))
                return const Color.fromRGBO(97, 62, 234, 0.5);
              return const Color.fromRGBO(
                  97, 62, 234, 1); // Use the component's default.
            },
          ),
          fixedSize:
              MaterialStateProperty.all(const Size(double.infinity, 56))),
    ),
    inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        prefixStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          letterSpacing: 0.1,
          color: Color.fromRGBO(137, 137, 137, 1),
        ),
        contentPadding: EdgeInsets.only(top: 20, bottom: 6),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(166, 170, 180, 0.6), width: 1),
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromRGBO(166, 170, 180, 0.6), width: 1))),
  );

  // Input borders
}

TextTheme _buildDefaultTextTheme() {
  return TextTheme(
    button: TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
        color: Colors.white,
        fontSize: 16),
    // slider title
    headline5: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
        color: Colors.black),
    // logo snizu
    headline3: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      fontSize: 30.0,
    ),
    caption: TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      fontSize: 14.0,
    ),
    // defaultBodyText
    bodyText2: TextStyle(
      fontWeight: FontWeight.w600,
      height: 1.4,
      color: const Color.fromRGBO(0, 0, 0, 1),
      fontSize: 16.0,
    ),

    // form input values style
    subtitle1: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      letterSpacing: 0.1,
      color: Color.fromRGBO(59, 65, 75, 1),
    ),

    // slider body text
    bodyText1: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
        height: 1.4,
        color: const Color.fromRGBO(59, 65, 75, 1),
        fontSize: 18.0,
        letterSpacing: 0.2),
  );
}
