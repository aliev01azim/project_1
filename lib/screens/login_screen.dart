import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:test_app/widgets/logo_widget.dart';

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
                  keyboardType: TextInputType.phone,
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

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final digitOnly = newValue.text.replaceAll(RegExp(r'[^\d]+'), '');
    final initialSymbolCount = newValue.selection
        .textBefore(newValue.text)
        .replaceAll(RegExp(r'[\d]+'), '')
        .length;
    final cursorPosition = newValue.selection.start - initialSymbolCount;
    var finalCursorPosition = cursorPosition;
    final digitOnlyChars = digitOnly.split('');

    if (oldValue.selection.textInside(oldValue.text) == ' ') {
      digitOnlyChars.removeAt(cursorPosition - 1);
      finalCursorPosition -= 2;
    }
    var newString = <String>[];
    for (var i = 0; i < digitOnlyChars.length; i++) {
      if (i == 3 || i == 5 || i == 7) {
        newString.add(' ');
        newString.add(digitOnlyChars[i]);
        if (i <= cursorPosition) finalCursorPosition += 1;
      } else {
        newString.add(digitOnlyChars[i]);
      }
    }

    final resultString = newString.join('');

    return TextEditingValue(
      text: resultString,
      selection: TextSelection.collapsed(offset: finalCursorPosition),
    );
  }
}
