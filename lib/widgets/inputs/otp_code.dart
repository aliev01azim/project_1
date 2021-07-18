import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:test_app/constants/constants.dart';

class OtpCode extends StatefulWidget {
  const OtpCode({Key? key}) : super(key: key);

  @override
  _OtpCodeState createState() => _OtpCodeState();
}

class _OtpCodeState extends State<OtpCode> {
  @override
  Widget build(BuildContext context) {
    return PinFieldAutoFill(
        decoration: UnderlineDecoration(
            colorBuilder: FixedColorBuilder(Colorss.pinAutoFillBorderColor),
            textStyle: TextStyle(color: Colors.black)),
        // currentCode: // prefill with a code
        // onCodeSubmitted: //code submitted callback
        // onCodeChanged: //code changed callback
        codeLength: 6);
  }
}
