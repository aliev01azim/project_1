import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:test_app/screens/home_screen.dart';
import 'package:test_app/widgets/logo_widget.dart';
import 'package:test_app/widgets/otp_code.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Timer? _timer;
  int _start = 60;
  final _otp = TextEditingController();
  String _currentCode = '';
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // _listenOtp();
    startTimer();
  }

  @override
  void dispose() {
    _timer!.cancel();
    _otp.dispose();
    super.dispose();
  }

  void _listenOtp() async {
    await SmsAutoFill().listenForCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [
          LogoWidget(),
          const SizedBox(
            height: 51,
          ),
          Text(
            'Введите код из СМС',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(
            height: 89,
          ),
          PinFieldAutoFill(
              decoration: UnderlineDecoration(
                  colorBuilder:
                      FixedColorBuilder(Color.fromRGBO(166, 170, 180, 0.6)),
                  textStyle: TextStyle(color: Colors.black)),
              currentCode: _currentCode,
              // onCodeSubmitted: //code submitted callback
              onCodeChanged: (p0) {
                setState(() {
                  _currentCode = p0!;
                });
              },
              codeLength: 6),
          const SizedBox(
            height: 36,
          ),
          TextButton(
              onPressed: _start == 0 ? () {} : null,
              child: Text('Повторно запросить код ($_start)')),
          const SizedBox(
            height: 88,
          ),
          ElevatedButton(
            onPressed: _currentCode.length < 6
                ? () async {
                    Get.to(() => HomeScreen());
                  }
                : null,
            child: Text(
              "Продолжить",
              style: TextStyle(color: Colors.white),
            ),
          )
        ]),
      ),
    );
  }
}
