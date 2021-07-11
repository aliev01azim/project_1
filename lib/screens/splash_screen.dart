import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/splash.png',
          width: MediaQuery.of(context).size.width * 0.785,
        ),
      ),
    );
  }
}
