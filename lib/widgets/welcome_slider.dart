import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/screens/login_screen.dart';

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    required this.controller,
    required this.itemCount,
    required this.onPageSelected,
    this.color: Colors.indigo,
  }) : super(listenable: controller);

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

class WelcomeSlider extends StatefulWidget {
  @override
  State createState() => WelcomeSliderState();
}

class WelcomeSliderState extends State<WelcomeSlider> {
  final _controller = PageController();

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  final List<Widget> _pages = <Widget>[
    ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Column(
        children: [
          Text(
            'Ваш помощник по переездам, грузоперевозкам и не только',
            textAlign: TextAlign.center,
          ),
          Spacer(),
          SvgPicture.asset(SLIDER_SVG_1),
          Spacer(),
        ],
      ),
    ),
    ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Column(
        children: [
          Text(
            'Ваш помощник по переездам, грузоперевозкам и не только',
            textAlign: TextAlign.center,
          ),
          SvgPicture.asset(SLIDER_SVG_2),
        ],
      ),
    ),
    ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Column(
        children: [
          Text(
            'Ваш помощник по переездам, грузоперевозкам и не только',
            textAlign: TextAlign.center,
          ),
          SvgPicture.asset(SLIDER_SVG_3),
        ],
      ),
    ),
  ];
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: PageView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            controller: _controller,
            itemBuilder: (BuildContext context, int index) {
              pageIndex = index + 1;
              return _pages[index];
            },
            itemCount: _pages.length,
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            await _controller.animateToPage(pageIndex,
                duration: _kDuration, curve: _kCurve);
            if (pageIndex == 3) {
              // Get.off(() => LoginScreen());
              Get.to(() => LoginScreen());
            }
          },
          child: Text('Продолжить'),
          style: ElevatedButton.styleFrom(elevation: 6),
        ),
        SizedBox(
          height: 29,
        ),
        Container(
          height: 10,
          child: Center(
            child: DotsIndicator(
              controller: _controller,
              itemCount: _pages.length,
              onPageSelected: (int page) async {
                print('obrazets:$page');
                await _controller.animateToPage(
                  page,
                  duration: _kDuration,
                  curve: _kCurve,
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextButton(
            onPressed: () {
              Get.to(() => LoginScreen());
            },
            child: Text(
              'пропустить',
              style: TextStyle(
                  color: Color.fromRGBO(97, 62, 234, 0.4),
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ))
      ],
    );
  }
}
