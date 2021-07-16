import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/screens/kuda_poedem_screen.dart';
import 'package:test_app/widgets/status_zakaza_slider_widgets/palochki.dart';

class SecondSliderOfStatusZakaza extends StatelessWidget {
  const SecondSliderOfStatusZakaza({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Заказ принят',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            TextButton(
              onPressed: () async {
                await Get.to(() => KudaPoedemScreen(fromDetailScreen: false));
              },
              child: Text(
                'карта',
                style: TextStyle(
                  color: Colorss.primary,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Palochki(isFiolet: true),
            Palochki(isFiolet: true),
            Palochki(isFiolet: false),
            Palochki(isFiolet: false),
          ],
        ),
        const SizedBox(
          height: 52,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Отменить'),
        )
      ],
    );
  }
}
