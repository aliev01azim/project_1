import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:test_app/controllers/login_controller.dart';

import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final LoginController loginController = Get.find();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('asdadasd'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await auth.signOut();
          Hive.box('tokenBox').clear();
          Get.off(() => LoginScreen());
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}
