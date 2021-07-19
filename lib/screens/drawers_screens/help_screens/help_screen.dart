import 'package:flutter/material.dart';
import 'package:test_app/screens/drawers_screens/help_screens/help_listTile_widget.dart';
import 'package:test_app/screens/drawers_screens/help_screens/problem_with_money_screens/problem_with_money_screen.dart';
import 'package:test_app/widgets/appBar.dart';
import 'package:test_app/widgets/app_drawer.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Помощь'),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.only(top: 23),
        child: Column(
          children: [
            HelpListTile(
              title: 'Проблема с заказом',
              page: ProblemWithMoneyScreen(),
            ),
            HelpListTile(
              title: 'Что то с деньгами',
              page: ProblemWithMoneyScreen(),
            ),
            HelpListTile(
              title: 'В машине остались вещи',
              page: ProblemWithMoneyScreen(),
            ),
            HelpListTile(
              title: 'Экстренная ситуация',
              page: ProblemWithMoneyScreen(),
            ),
            HelpListTile(
              title: 'Оставить отзыв',
              page: ProblemWithMoneyScreen(),
            ),
            HelpListTile(
              title: 'Частые вопросы',
              page: ProblemWithMoneyScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
