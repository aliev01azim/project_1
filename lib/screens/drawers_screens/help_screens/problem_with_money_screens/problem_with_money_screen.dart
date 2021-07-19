import 'package:flutter/material.dart';
import 'package:test_app/widgets/appBar.dart';

import '../help_listTile_widget.dart';
import 'payed_twice_subscreen.dart';

class ProblemWithMoneyScreen extends StatelessWidget {
  const ProblemWithMoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Что то с деньгами'),
      body: Padding(
        padding: EdgeInsets.only(top: 23),
        child: Column(
          children: [
            HelpListTile(
              title: 'Поездки не было',
              page: PayedTwiceSubscreen(),
            ),
            HelpListTile(
              title: 'Заплатили дважды',
              page: PayedTwiceSubscreen(),
            ),
            HelpListTile(
              title: 'Изменилась стоимость',
              page: PayedTwiceSubscreen(),
            ),
            HelpListTile(
              title: 'Появился долг',
              page: PayedTwiceSubscreen(),
            ),
            HelpListTile(
              title: 'Другая проблема',
              page: PayedTwiceSubscreen(),
            ),
          ],
        ),
      ),
    );
  }
}
