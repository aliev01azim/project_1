import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/screens/login_screen.dart';
import 'package:test_app/widgets/start_slider_widgets.dart/slider_dots.dart';
import 'package:test_app/widgets/start_slider_widgets.dart/first_page_of_slider.dart';
import 'package:test_app/widgets/start_slider_widgets.dart/second_page_of_slider.dart';

class WelcomeSlider extends StatefulWidget {
  const WelcomeSlider({Key? key}) : super(key: key);

  @override
  _WelcomeSliderState createState() => _WelcomeSliderState();
}

class _WelcomeSliderState extends State<WelcomeSlider> {
  PageController controller = PageController();
  var currentPageValue = 0.0;
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  final List<Widget> _pages = [
    FirstPageOfSlider(),
    SecondPageOfSlider(
        title: 'Грузовые авто на выбор',
        text:
            'Различные виды транспорта в вашем распоряжении. Бусы, газели, эвакуатор и прочая спецтехника для ваших нужд.'),
    SecondPageOfSlider(
        title: 'Грузчики на помощь',
        text:
            'Наши грузчики будут рады помочь вам с переездом. Заказывайте нужно количество грузчиков в 1 клик'),
  ];

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(() {});
    controller.dispose();
    super.dispose();
  }

  int click = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 439,
          child: PageView(
            controller: controller,
            children: _pages,
            physics: AlwaysScrollableScrollPhysics(),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            click++;
            await controller.nextPage(duration: _kDuration, curve: _kCurve);
            if (click == 4) {
              await Get.to(() => LoginScreen());
            }
          },
          child: const Text(
            'Продолжить',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 0.1),
          ),
          style: ElevatedButton.styleFrom(elevation: 6),
        ),
        const SizedBox(
          height: 30,
        ),
        DotsIndicator(
          controller: controller,
          itemCount: _pages.length,
          onPageSelected: (int page) async {
            await controller.animateToPage(
              page,
              duration: _kDuration,
              curve: _kCurve,
            );
          },
        ),
        const SizedBox(
          height: 24,
        ),
        TextButton(
          onPressed: () async {
            await Get.to(() => LoginScreen());
          },
          child: const Text(
            'пропустить',
            style: TextStyle(
                color: Color.fromRGBO(97, 62, 234, 0.4),
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
        )
      ],
    );
  }
}
