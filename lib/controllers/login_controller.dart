import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:test_app/screens/home_screen.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var verId = '';
  var phoneForOtpScreen = '';
  var auth = FirebaseAuth.instance;
  verifyPhone(String phone) async {
    phoneForOtpScreen = phone;
    isLoading.value = true;
    await auth.verifyPhoneNumber(
        timeout: const Duration(seconds: 60),
        phoneNumber: '+996' + phone,
        verificationCompleted: (_) {
          isLoading.value = false;
        },
        verificationFailed: (authException) {
          Get.snackbar('Error!', authException.message.toString());
        },
        codeSent: (String id, [int? forceResent]) {
          isLoading.value = false;
          verId = id;
        },
        codeAutoRetrievalTimeout: (String id) {
          verId = id;
        });
  }

  void storeTokenAndData(UserCredential userCredential) async {
    final box = Hive.box('tokenBox');
    await box.put('token', userCredential.credential!.token.toString());
  }

  void otpVerify(String otp) async {
    isLoading.value = true;
    try {
      UserCredential userCredential = await auth.signInWithCredential(
          PhoneAuthProvider.credential(verificationId: verId, smsCode: otp));
      if (userCredential.user != null) {
        isLoading.value = false;
        Get.to(() => HomeScreen());
      }
    } on FirebaseException catch (e) {
      Get.snackbar("otp info", e.message!);
    }
  }
}
