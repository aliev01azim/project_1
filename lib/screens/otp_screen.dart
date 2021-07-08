import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controllers/login_controller.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Timer? _timer;
  int _start = 60;
  final _loginController = Get.put(LoginController());
  final _otp = TextEditingController();

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

  void setData(String verificationId) {
    setState(() {
      _loginController.verId = verificationId;
    });
    startTimer();
  }

  @override
  void dispose() {
    _timer!.cancel();
    _otp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loginController.isLoading(false)
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _otp,
                  decoration: const InputDecoration(
                    hintText: "Enter OTP",
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextButton(
                  onPressed: () {
                    _loginController.otpVerify(_otp.text);
                  },
                  child: const Text("VERIFY"),
                ),
                Text(_start.toString()),
                TextButton(
                  onPressed: () async {
                    await _loginController
                        .verifyPhone(_loginController.phoneForOtpScreen);
                  },
                  child: const Text("Resend"),
                ),
              ],
            ),
    );
  }
}
