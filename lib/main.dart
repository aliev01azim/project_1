import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app/screens/home_screen.dart';
import 'package:test_app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'screens/start_screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('tokenBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration.zero),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: Splash(),
            debugShowCheckedModeBanner: false,
          );
        } else {
          return GetMaterialApp(
            title: 'Gruz Master',
            theme: defaultTheme,
            debugShowCheckedModeBanner: false,
            home: const InitializerWidget(),
          );
        }
      },
    );
  }
}

class InitializerWidget extends StatelessWidget {
  const InitializerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return Hive.box('tokenBox').get('token') != null
    //     ? HomeScreen()
    //     : StartScreen();
    return HomeScreen();
  }
}
