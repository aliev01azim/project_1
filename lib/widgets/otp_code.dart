import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

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
            colorBuilder: FixedColorBuilder(Color.fromRGBO(166, 170, 180, 0.6)),
            textStyle: TextStyle(color: Colors.black)),
        // currentCode: // prefill with a code
        // onCodeSubmitted: //code submitted callback
        // onCodeChanged: //code changed callback
        codeLength: 6);
  }
}
