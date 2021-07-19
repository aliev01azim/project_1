import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/models/question_of_user_model.dart';
import 'package:test_app/widgets/inputs/outlined_custom_input.dart';

class QuestionFormWidget extends StatefulWidget {
  const QuestionFormWidget({Key? key}) : super(key: key);

  @override
  _QuestionFormWidgetState createState() => _QuestionFormWidgetState();
}

class _QuestionFormWidgetState extends State<QuestionFormWidget> {
  final _formKey = GlobalKey<FormState>();
  var _editedQuestion = QuestionModel(
    email: '',
    number: '',
    dateOfZakaz: '',
    comment: '',
  );
  var _isLoading = false;

  Future<void> _saveForm() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    print(_editedQuestion.comment);
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
    } finally {
      Get.back();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Отзыв отправлен')));
    }
  }

  void _callBackForValue(String value) {
    _editedQuestion.comment = value;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomOutlinedInput(
            title: 'Email',
            propertyOfCard: _editedQuestion.email!,
            callBack: _callBackForValue,
            isComment: false,
          ),
          CustomOutlinedInput(
            title: 'Телефон',
            propertyOfCard: _editedQuestion.number!,
            callBack: _callBackForValue,
            isComment: false,
          ),
          CustomOutlinedInput(
            title: 'Дата и примерное время заказа',
            propertyOfCard: _editedQuestion.dateOfZakaz!,
            callBack: _callBackForValue,
            isComment: false,
          ),
          CustomOutlinedInput(
            title: 'Комментарий',
            propertyOfCard: _editedQuestion.comment!,
            callBack: _callBackForValue,
            isComment: true,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: _saveForm,
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Text('Отправить'))
        ],
      ),
    );
  }
}
