import 'package:flutter/material.dart';
import 'package:test_app/widgets/logo_widget.dart';
import 'package:test_app/widgets/welcome_slider.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 49,
              ),
              const LogoWidget(),
              WelcomeSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
