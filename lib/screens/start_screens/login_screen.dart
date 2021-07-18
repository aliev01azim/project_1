import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:test_app/widgets/inputs/input_formatters/login_input_formatter.dart';
import 'package:test_app/widgets/start_slider_widgets.dart/logo_widget.dart';

import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phone = TextEditingController();

  @override
  void dispose() {
    _phone.dispose();
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(children: [
            LogoWidget(),
            const SizedBox(
              height: 51,
            ),
            Text(
              'Войти или создать аккаунт',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(
              height: 89,
            ),
            Form(
              child: Column(children: [
                TextFormField(
                  controller: _phone,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: [PhoneInputFormatter()],
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                      fontSize: 22,
                      letterSpacing: 0.22),
                  maxLength: 12,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: const InputDecoration(
                      prefixText: '+996  ',
                      counterText: '',
                      prefixStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                          letterSpacing: 0.22),
                      floatingLabelBehavior: FloatingLabelBehavior.never),
                ),
                const SizedBox(
                  height: 88,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Надо добавить в http,то есть
                    // ExampleApp: Your code is 123456
                    // FA+9qCX9VSu
                    // final signCode = await SmsAutoFill().getAppSignature;
                    // print(signCode);
                    await Get.to(() => const OtpScreen());
                  },
                  child: Text("Получить код"),
                )
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
