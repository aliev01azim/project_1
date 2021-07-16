import 'package:flutter/material.dart';
import 'package:test_app/widgets/status_zakaza_slider_widgets/palochki.dart';

class FirstSliderOfStatusZakaza extends StatelessWidget {
  const FirstSliderOfStatusZakaza({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Поиск исполнителя',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Palochki(isFiolet: true),
            Palochki(isFiolet: false),
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
