import 'package:flutter/material.dart';
import 'package:test_app/constants/constants.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Images.splashImage,
          width: MediaQuery.of(context).size.width * 0.785,
        ),
      ),
    );
  }
}
