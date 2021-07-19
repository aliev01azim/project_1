import 'package:flutter/material.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/widgets/status_zakaza_slider_widgets/palochki.dart';

class FourstSliderOfStatusZakaza extends StatefulWidget {
  const FourstSliderOfStatusZakaza(
      {Key? key, required this.time, required this.itogo})
      : super(key: key);
  final int time;
  final int itogo;
  @override
  State<FourstSliderOfStatusZakaza> createState() =>
      _FourstSliderOfStatusZakazaState();
}

class _FourstSliderOfStatusZakazaState
    extends State<FourstSliderOfStatusZakaza> {
  final String carNumber = '01KG123AIT';
  final String carMark = 'Синий газель,госномер';
  final String driverName = 'Водитель:Адилет';
  final String phoneNumber = '+996 555 123 123';

  @override
  Widget build(BuildContext context) {
    print(widget.time);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Заказ завершен',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              widget.time.toString(),
              style: TextStyle(color: Colorss.primary, fontSize: 16),
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
            Palochki(isFiolet: true),
            Palochki(isFiolet: true),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Row(
              children: [
                Text(
                  '$carMark: ',
                  style: TextStyle(color: Color.fromRGBO(117, 127, 140, 1)),
                ),
                Text('$carNumber'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  '$driverName: ',
                  style: TextStyle(color: Color.fromRGBO(117, 127, 140, 1)),
                ),
                Text('$phoneNumber'),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        const Divider(),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Итого',
              style:
                  Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 20),
            ),
            Text(
              '${widget.itogo} сом',
              style:
                  Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 20),
            ),
          ],
        ),
      ],
    );
  }
}
