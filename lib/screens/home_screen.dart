import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/widgets/app_drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'login_screen.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Image.asset('assets/images/hamburger'),
      //     onPressed: () => _scaffoldKey.currentState?.openDrawer(),
      //   ),
      // ),
      appBar: AppBar(),
      drawer: AppDrawer(),
      body: Container(
        constraints: BoxConstraints.expand(height: 100),
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            // GoogleMap(
            //   onMapCreated: _onMapCreated,
            //   initialCameraPosition: CameraPosition(
            //     target: _center,
            //     zoom: 11.0,
            //   ),
            //   mapType: _currentMapType,
            //   markers: _markers,
            //   onCameraMove: _onCameraMove,
            // ),
            Positioned(
              right: 16,
              top: 15,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.white.withOpacity(0.8),
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    side: BorderSide(
                        width: 1,
                        color: Color.fromRGBO(97, 62, 234, 1),
                        style: BorderStyle.solid)),
                child: const Icon(
                  Icons.navigation_outlined,
                  size: 25.0,
                  color: Color.fromRGBO(97, 62, 234, 1),
                ),
              ),
            ),
            Positioned(
              bottom: 18,
              left: 16,
              child: ElevatedButton(
                onPressed: () async {
                  // Get.to(() => const OtpScreen());
                },
                child: Text("Продолжить"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
