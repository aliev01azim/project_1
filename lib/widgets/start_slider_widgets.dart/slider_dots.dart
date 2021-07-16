import 'dart:math';

import 'package:flutter/material.dart';

class DotsIndicator extends AnimatedWidget {
  const DotsIndicator({
    Key? key,
    required this.controller,
    required this.itemCount,
    required this.onPageSelected,
    this.color = Colors.indigo,
  }) : super(listenable: controller, key: key);

  final PageController controller;
  final int itemCount;
  final ValueChanged<int> onPageSelected;

  final Color color;
  static const double _kDotSize = 6.0;
  static const double _kMaxZoom = 1.6;
  static const double _kDotSpacing = 20.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return Container(
      height: 10,
      child: Center(
        child: Container(
          width: _kDotSpacing,
          child: Center(
            child: Material(
              color: color,
              type: MaterialType.circle,
              child: Container(
                width: _kDotSize * zoom,
                height: _kDotSize * zoom,
                child: InkWell(
                  onTap: () => onPageSelected(index),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
