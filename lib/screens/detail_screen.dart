import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Детали заказа'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 23, left: 15, right: 35, bottom: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    input('ул Токтогула 114', 'Откуда    '),
                    input('тц Ала-Арча', 'Куда        '),
                    input('Сейчас', 'Дата/время  '),
                    input('0   +', 'Кол-во гр       '),
                    inputComment('Комментарий   '),
                    const SizedBox(height: 32),
                    Text('Стоимость авто/час = 1000 сом'),
                    const SizedBox(height: 32),
                    Text('Стоимость грузчиков/час = 1000 сом'),
                    const SizedBox(height: 32),
                    Text('ИТОГО 2000 сом/час'),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Заказать'),
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(Size(double.infinity, 56))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget input(String value, String pref) {
    return TextFormField(
      initialValue: value,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 30, bottom: 8),
        prefix: Text(
          pref,
          style: TextStyle(height: 0.8),
        ),
      ),
    );
  }

  Widget inputComment(String pref) {
    return TextFormField(
      initialValue: '',
      autofocus: true,
      maxLines: 10,
      minLines: 1,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 30, bottom: 8),
        prefix: Text(
          pref,
          style: TextStyle(height: 0.8),
        ),
      ),
    );
  }
}
