import 'package:flutter/material.dart';

class StatusZakazaScreen extends StatelessWidget {
  const StatusZakazaScreen({Key? key}) : super(key: key);
  final int _selectedCount = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Заказ газели, 14.07.2021'),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              input('ул. Шевченко 114', 'Откуда'),
              input('пр. Манаса 45', 'Куда'),
              input('Дата и время', 'Дата и время'),
              input('2', 'Кол-во грузчиков'),
              input('Серое 4-х этажное здание, вход со стороны Шевченко',
                  'Комментарий'),
              const SizedBox(
                height: 20,
              ),
              description('Авто'),
              const SizedBox(
                height: 12,
              ),
              description('Грузчики', true),
              const Divider(
                height: 32,
              ),
              Text(
                'ИТОГО ${_selectedCount * 500 + 1000} сом/час',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(
                height: 21,
              ),
              Text(
                'Статус заказа',
                style: Theme.of(context).textTheme.overline,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Поиск исполнителя',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget input(String value, String pref) {
    return TextFormField(
      readOnly: true,
      maxLines: 10,
      initialValue: value,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 45, bottom: 8),
        labelText: pref,
      ),
    );
  }

  Widget description(String name, [bool _isGruzchiki = false]) {
    return Row(
      children: [
        Text(_isGruzchiki ? '$name ($_selectedCount)' : '$name'),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('1 час'),
            SizedBox(
              width: 30,
            ),
            Text(_isGruzchiki ? '${_selectedCount * 500}сом' : '1000сом')
          ],
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
