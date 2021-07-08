import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/constants/constants.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(LOGO),
        const SizedBox(
          width: 5,
        ),
        Text(
          'GruzMaster',
          style: Theme.of(context).textTheme.headline3,
        )
      ],
    );
  }
}
