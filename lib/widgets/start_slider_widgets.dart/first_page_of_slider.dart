import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/constants/constants.dart';

class FirstPageOfSlider extends StatelessWidget {
  const FirstPageOfSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 26,
        ),
        Text(
          'Ваш помощник по переездам, грузоперевозкам и не только',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(
          height: 80,
        ),
        Container(
          height: 233,
          child: SvgPicture.asset(Images.sliderSvg1),
        ),
      ],
    );
  }
}
