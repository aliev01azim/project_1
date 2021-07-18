import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/widgets/appBar.dart';
import 'package:test_app/widgets/app_drawer.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({Key? key}) : super(key: key);

  @override
  _PersonalDataScreenState createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  final _formKey = GlobalKey<FormState>();
  var _initialValue = {
    'name': 'Иван',
    'email': 'ivan@gmail.com',
    'phoneNumber': '+996 555 123 123',
  };
  // bool _initialized = true;
  // @override
  // void didChangeDependencies() {
  //   if (_initialized) {
  //     // final _profile = загрузка его данных от сервака...
  //     // и ...
  //     _initialValue = {
  //       'email': _profile['email'],
  //       'name': _profile['name'],
  //       'phoneNumber': _profile['phoneNumber'],
  //
  //     };
  //     _initialized = true;
  //   }
  //   super.didChangeDependencies();
  // }

  var _editedProfile = UserModel(email: '', name: '');
  var _isLoading = false;
  // form
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
      appBar: AppBarWidget('Персональные данные'),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Form(
                key: _formKey,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Имя',
                              contentPadding:
                                  EdgeInsets.only(top: 20, bottom: 6),
                            ),
                            initialValue: _initialValue['name'],
                            onSaved: (newValue) {
                              _editedProfile = UserModel(
                                email: newValue!,
                                name: _editedProfile.name,
                              );
                            },
                          ),
                          TextFormField(
                            initialValue: _initialValue['email'],
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              contentPadding:
                                  EdgeInsets.only(top: 64, bottom: 6),
                            ),
                            validator: (value) {
                              if (!value!.contains('mail')) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              _editedProfile = UserModel(
                                email: val.toString(),
                                name: _editedProfile.name,
                              );
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: _initialValue['phoneNumber'],
                              labelText: 'Телефон',
                              contentPadding:
                                  EdgeInsets.only(top: 64, bottom: 6),
                            ),
                            readOnly: true,
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 18,
                        left: 0,
                        right: 0,
                        child: ElevatedButton(
                          onPressed: _saveForm,
                          child: Text('Сохранить'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
