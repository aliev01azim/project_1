import 'package:flutter/material.dart';
import 'package:test_app/constants/constants.dart';

class Palochki extends StatelessWidget {
  const Palochki({Key? key, required this.isFiolet}) : super(key: key);
  final bool isFiolet;
  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 80) / 4;
    return Container(
      width: width,
      height: 4,
      color: isFiolet ? Colorss.primary : Color.fromRGBO(97, 62, 234, 0.3),
    );
  }
}
