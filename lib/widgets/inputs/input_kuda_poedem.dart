import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/screens/kuda_poedem_screen.dart';

class InputKudaPoedem extends StatelessWidget {
  const InputKudaPoedem(
      {Key? key, required this.value, required this.prefix, required this.text})
      : super(key: key);
  final String value;
  final String prefix;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // initialValue: text!,
      decoration: InputDecoration(
        hintText: value,
        contentPadding: EdgeInsets.only(top: 50, bottom: 8),
        labelText: prefix,
        suffix: TextButton(
          onPressed: () {
            Get.to(() => KudaPoedemScreen(
                  fromDetailScreen: true,
                ));
          },
          child: Text(
            'карта',
            style: TextStyle(
              color: Colorss.primary,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
