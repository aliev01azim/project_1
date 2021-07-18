import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/constants/constants.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const SizedBox(
        height: 49,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Images.logo,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            'GruzMaster',
            style: Theme.of(context).textTheme.headline3,
          )
        ],
      ),
    ]);
  }
}
