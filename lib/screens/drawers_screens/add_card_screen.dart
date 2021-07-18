import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controllers/payment_card_controller.dart';
import 'package:test_app/models/payment_card_model.dart';
import 'package:test_app/widgets/appBar.dart';
import 'package:test_app/widgets/inputs/input_add_card.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final PaymentCardController _cardController =
      Get.put(PaymentCardController());
  final _formKey = GlobalKey<FormState>();
  var _editedCard = PaymentCardModel(
    isEnable: true,
    cardNumber: '',
    period: '',
    cvc: '',
    userName: '',
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

    try {
      _cardController.addCard(_editedCard);
    } on HttpException catch (error) {
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
    } finally {
      Get.back();
    }
  }

  void _callBackForValue(String value) {
    if (value.length == 19) {
      _editedCard.cardNumber = value.replaceAll(' ', '');
    } else if (value.length == 5) {
      _editedCard.period = value.replaceAll('-', '');
    }
  }

  void _callBackForUserName(String value) {
    _editedCard.userName = value;
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Номер карты',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Container(
                      width: double.infinity,
                      child: AddCardInput(
                        callBack: _callBackForValue,
                        isSeperated: false,
                        initalValue: _initialValue['cardNumber']!,
                        propertyOfCard: _editedCard.cardNumber!,
                        maxLength: 19,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Срок действия',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(
                          'CVV / CVC',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          child: AddCardInput(
                            callBack: _callBackForValue,
                            initalValue: _initialValue['period']!,
                            propertyOfCard: _editedCard.period!,
                            maxLength: 5,
                            isSeperated: true,
                          ),
                        ),
                        Container(
                          width: 80,
                          child: AddCardInput(
                            callBack: _callBackForValue,
                            initalValue: _initialValue['cvc']!,
                            propertyOfCard: _editedCard.cvc!,
                            maxLength: 3,
                            isSeperated: false,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Имя на карте',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    NameInput(
                      callBack: _callBackForUserName,
                      initialVal: _initialValue['userName']!,
                      propertyOfCard: _editedCard.userName!,
                    ),
                    ElevatedButton(
                      onPressed: _saveForm,
                      child: Text('Добавить карту'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class NameInput extends StatelessWidget {
  NameInput(
      {Key? key,
      required this.initialVal,
      required this.propertyOfCard,
      required this.callBack})
      : super(key: key);
  final String initialVal;
  final Function callBack;
  String propertyOfCard;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        decoration: InputDecoration(
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
          if (value!.length == 0) {
            return 'Заполните это поле';
          }
          return null;
        },
        style: Theme.of(context).textTheme.headline4,
        initialValue: initialVal,
        onSaved: (newValue) => propertyOfCard = newValue!,
      ),
    );
  }
}
