import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controllers/login_controller.dart';

import 'otp_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final phone = TextEditingController();
  final LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: loginController.isLoading(false)
          ? const Center(child: CircularProgressIndicator())
          : Form(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: TextFormField(
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        labelText: 'Phone Number', prefixText: '+996'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40, bottom: 5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        loginController.verifyPhone(phone.text, () {});
                        Get.to(() => const OtpScreen());
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 15.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Expanded(
                                  child: Text(
                                "Sign In",
                                textAlign: TextAlign.center,
                              )),
                            ],
                          )),
                    ),
                  ),
                ),
              ]),
            ),
    );
  }
}
