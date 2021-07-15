import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/screens/detail_screen.dart';
import 'package:test_app/widgets/app_drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController mapController;
  bool showBottomSheett = true;
  bool showKudaInput = true;
  final LatLng _currentLocation = const LatLng(42.869937, 74.590002);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

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
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            child: GoogleMap(
              buildingsEnabled: true,
              compassEnabled: false,
              mapToolbarEnabled: false,
              mapType: MapType.normal,
              myLocationButtonEnabled: false,
              onCameraMoveStarted: () {
                setState(() {
                  showBottomSheett = false;
                });
              },
              zoomControlsEnabled: false,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _currentLocation,
                zoom: 15.0,
              ),
            ),
          ),
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
                      color: Colorss.primary,
                      style: BorderStyle.solid)),
              child: const Icon(Icons.navigation_outlined,
                  size: 25.0, color: Colorss.primary),
            ),
          ),
          if (showBottomSheett)
            Positioned(
              bottom: showKudaInput ? 84 : 130,
              left: 13,
              right: 13,
              child: Container(
                height: showKudaInput ? 230 : 184,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mini_container(context, Images.miniContainer1,
                              'Газели', true, true),
                          mini_container(context, Images.miniContainer2,
                              'Грузчики', false, false),
                          mini_container(context, Images.miniContainer3,
                              'Эвакуаторы', true, false),
                          mini_container(context, Images.miniContainer4,
                              'Спецтехника', false, false),
                        ],
                      ),
                      SizedBox(height: 20),
                      if (showKudaInput)
                        TextFormField(
                          initialValue: 'ул Токтогула 114',
                          decoration: InputDecoration(
                            prefix: Container(
                              child: Text(
                                'Откуда',
                                style: TextStyle(height: 0.8),
                              ),
                              width: 75,
                            ),
                          ),
                        ),
                      TextFormField(
                        initialValue: 'тц Ала-Арча',
                        decoration: InputDecoration(
                          prefix: Container(
                            child: Text(
                              'Куда',
                              style: TextStyle(height: 0.8),
                            ),
                            width: 75,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          Positioned(
            bottom: 18,
            left: 13,
            right: 13,
            child: ElevatedButton(
              onPressed: () async {
                setState(() {
                  showBottomSheett = true;
                });
                Get.to(() => DetailScreen());
              },
              child: const Text("Продолжить"),
            ),
          ),
        ],
      ),
    );
  }

  Widget mini_container(BuildContext context, String image, String name,
      bool isShowed, bool isActive) {
    final deviceWitdh = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        setState(() {
          showKudaInput = isShowed;
        });
      },
      child: Column(children: [
        Container(
          width: deviceWitdh < 340 ? 60 : 70,
          height: deviceWitdh < 340 ? 60 : 70,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isActive
                ? Color.fromRGBO(97, 62, 234, 0.2)
                : Color.fromRGBO(240, 240, 240, 1),
            border:
                isActive ? Border.all(color: Colorss.primary, width: 1) : null,
          ),
          child: SvgPicture.asset(
            image,
            alignment: Alignment.center,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 10,
            height: 1,
            color: Color.fromRGBO(59, 65, 75, 1),
          ),
        )
      ]),
    );
  }
}
