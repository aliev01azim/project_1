import 'package:flutter/material.dart';
import 'package:test_app/widgets/logo_widget.dart';
import 'package:test_app/widgets/welcome_slider.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final deviceWitdh = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 33, right: 33, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LogoWidget(),
              SizedBox(
                height: deviceWitdh > 335 ? 54 : 10,
              ),
              const WelcomeSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
