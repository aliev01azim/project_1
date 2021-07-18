import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_app/models/payment_card_model.dart';
import 'package:test_app/widgets/appBar.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _formKey = GlobalKey<FormState>();
  var _editedCard = PaymentCardModel(
    isEnable: true,
  );
  var _isLoading = false;
  var _initialValue = {
    'cardNumber': '',
    'period': '',
    'cvc': '',
    'userName': '',
  };

  Future<void> _saveForm() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {} on HttpException catch (error) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('An error occurred!'),
          content: Text(error.toString()),
          actions: <Widget>[
            TextButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget('Добавить карту'),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      'Номер карты',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 11, horizontal: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(185, 188, 221, 1),
                          ),
                        ),
                      ),
                      initialValue: _initialValue['name'],
                      onSaved: (newValue) {
                        _editedCard = PaymentCardModel(
                          cardNumber: newValue!,
                          period: _editedCard.period,
                          cvc: _editedCard.cvc,
                          userName: _editedCard.userName,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
