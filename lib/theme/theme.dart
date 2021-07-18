import 'package:flutter/material.dart';
import 'package:test_app/constants/constants.dart';

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
          backgroundColor: Colorss.primary,
          iconTheme: IconThemeData(color: Colors.white)),
      primaryColor: Colorss.primary,
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
                return Colorss.primary; // Use the component's default.
              },
            ),
            fixedSize:
                MaterialStateProperty.all(const Size(double.infinity, 56))),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 0,
            letterSpacing: 0.2,
            color: Color.fromRGBO(117, 127, 140, 1)),
        contentPadding: EdgeInsets.only(top: 20, bottom: 6),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Colorss.pinAutoFillBorderColor, width: 1),
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Colorss.pinAutoFillBorderColor, width: 1)),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            topRight: const Radius.circular(20.0),
          ),
        ),
      ),
      cardTheme: const CardTheme(
        margin: EdgeInsets.only(top: 20),
        elevation: 3,
        shadowColor: Color.fromRGBO(122, 122, 123, 0.32),
      ));
}

TextTheme _buildDefaultTextTheme() {
  return const TextTheme(
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
    // addCardScreen text
    headline4: TextStyle(
      color: Color.fromRGBO(52, 59, 113, 1),
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto',
      fontSize: 17.0,
      height: 1.15,
    ),
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
      fontWeight: FontWeight.w400,
      height: 1.2,
      color: const Color.fromRGBO(0, 0, 0, 1),
      fontSize: 14.0,
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
