import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app/screens/home_screen.dart';
import 'package:test_app/screens/login_screen.dart';
import 'package:test_app/screens/start_screen.dart';
import 'package:test_app/theme/theme.dart';

import 'controllers/login_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('tokenBox');
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: defaultTheme,
        debugShowCheckedModeBanner: false,
        home: const InitializerWidget());
  }
}

class InitializerWidget extends StatelessWidget {
  const InitializerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Hive.box('tokenBox').get('token') != null
        ? HomeScreen()
        // : LoginScreen();
        : const StartScreen();
  }
}
