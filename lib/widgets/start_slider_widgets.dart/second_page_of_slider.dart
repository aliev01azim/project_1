import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/constants/constants.dart';

class SecondPageOfSlider extends StatelessWidget {
  const SecondPageOfSlider({Key? key, required this.text, required this.title})
      : super(key: key);
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 7,
        ),
        Container(
            height: 151,
            child: SvgPicture.asset(
              Images.sliderSvg2,
            )),
        const SizedBox(
          height: 53,
        ),
        Text(title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5),
        const SizedBox(
          height: 30,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
