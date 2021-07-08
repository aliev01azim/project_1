import 'package:flutter/material.dart';

import 'custom_route.dart';

final ThemeData defaultTheme = _buildDefaultTheme();
ThemeData _buildDefaultTheme() {
  final ThemeData base = ThemeData();
  return base.copyWith(
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(97, 62, 234, 1),
      ),
      textTheme: _buildDefaultTextTheme(base.textTheme),
      primaryTextTheme: _buildDefaultTextTheme(base.primaryTextTheme),
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: CustomPageTransitionBuilder(),
        TargetPlatform.iOS: CustomPageTransitionBuilder(),
      }),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color.fromRGBO(97, 62, 234, 1),
            ),
            textStyle: MaterialStateProperty.all(const TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                color: Colors.white,
                fontSize: 16)),
            minimumSize:
                MaterialStateProperty.all(const Size(double.infinity, 50))),
      ));

  // Input borders
  //   inputDecorationTheme: InputDecorationTheme(
  //     isDense: true,
  //     errorStyle: TextStyle(color: Colors.red.shade900, height: 0),
  //     hintStyle: TextStyle(color: Colors.orange.shade900),
  //     filled: true,
  //     fillColor: Colors.transparent,
  //     errorBorder: UnderlineInputBorder(
  //       borderSide: BorderSide(color: Colors.transparent, width: 0),
  //     ),
  //     focusedBorder: UnderlineInputBorder(
  //       borderSide: BorderSide(color: Colors.transparent, width: 0),
  //     ),
  //     focusedErrorBorder: UnderlineInputBorder(
  //       borderSide: const BorderSide(color: Colors.transparent, width: 0),
  //     ),
  //     enabledBorder: UnderlineInputBorder(
  //       borderSide: BorderSide(color: Colors.transparent, width: 0),
  //     ),
  //     disabledBorder: UnderlineInputBorder(
  //       borderSide: BorderSide(color: Colors.transparent, width: 0),
  //     ),
  //   ),
  // );
}

TextTheme _buildDefaultTextTheme(TextTheme base) {
  return base.copyWith(
    headline5: base.headline5!.copyWith(
        fontSize: 26,
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
        color: Colors.black),
    // logo title -->
    headline3: base.headline3!.copyWith(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      fontSize: 30.0,
    ),
    caption: base.caption!.copyWith(
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      fontSize: 14.0,
    ),

    bodyText2: base.bodyText1!.copyWith(
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      height: 1.4,
      color: const Color.fromRGBO(59, 65, 75, 1),
      fontSize: 17.0,
    ),
  );
}
