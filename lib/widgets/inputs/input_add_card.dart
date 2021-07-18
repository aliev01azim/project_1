import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'input_formatters/cardnumber_input_formatter copy.dart';
import 'input_formatters/period_input_formatter copy.dart';

class AddCardInput extends StatelessWidget {
  AddCardInput(
      {Key? key,
      required this.callBack,
      required this.propertyOfCard,
      required this.initalValue,
      required this.maxLength,
      required this.isSeperated})
      : super(key: key);
  String propertyOfCard;
  final Function callBack;
  final String initalValue;
  final int maxLength;
  final bool isSeperated;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 30),
      child: TextFormField(
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          if (!isSeperated) CardNumberInputFormatter(),
          if (isSeperated) PeriodInputFormatter()
        ],
        decoration: InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.symmetric(vertical: 11, horizontal: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(
              color: Color.fromRGBO(185, 188, 221, 1),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(
              color: Color.fromRGBO(185, 188, 221, 1),
              width: 1,
            ),
          ),
        ),
        validator: (value) {
          if (value == null) {
            return 'Заполните это поле';
          } else if (value.length < maxLength) {
            return 'Поле заполнено недоконца';
          }
          return null;
        },
        style: Theme.of(context).textTheme.headline4,
        initialValue: initalValue,
        onSaved: (newValue) {
          propertyOfCard = newValue!;
          callBack(propertyOfCard);
        },
        maxLength: maxLength,
      ),
    );
  }
}
