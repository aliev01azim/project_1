import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/widgets/status_zakaza_slider_widgets/palochki.dart';

class ThirdSliderOfStatusZakaza extends StatefulWidget {
  const ThirdSliderOfStatusZakaza(this.callBackForTimerEndTime, {Key? key})
      : super(key: key);
  final Function callBackForTimerEndTime;
  @override
  State<ThirdSliderOfStatusZakaza> createState() =>
      _ThirdSliderOfStatusZakazaState();
}

class _ThirdSliderOfStatusZakazaState extends State<ThirdSliderOfStatusZakaza> {
  int _start = 0;
  final String carNumber = '01KG123AIT';
  final String carMark = 'Синий газель,госномер';
  final String driverName = 'Водитель:Адилет';
  final String phoneNumber = '+996 555 123 123';
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        // когда таймер кончается)просто сделал 5
        if (_start == 5) {
          setState(() {
            widget.callBackForTimerEndTime(_start);
            timer.cancel();
          });
        } else {
          setState(() {
            _start++;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Заказ исполняется',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              _start.toString(),
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
            Palochki(isFiolet: false),
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
      ],
    );
  }
}
