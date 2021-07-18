import 'package:flutter/material.dart';
import 'package:test_app/constants/constants.dart';

class Input extends StatelessWidget {
  const Input(
      {Key? key,
      required this.value,
      required this.prefix,
      required this.isUnderlinedBorder})
      : super(key: key);
  final String value;
  final String prefix;
  final bool isUnderlinedBorder;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 46, bottom: 8),
        labelText: prefix,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: isUnderlinedBorder
                  ? Colorss.pinAutoFillBorderColor
                  : Colors.transparent,
              width: 1),
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: isUnderlinedBorder
                    ? Colorss.pinAutoFillBorderColor
                    : Colors.transparent,
                width: 1)),
      ),
    );
  }
}
