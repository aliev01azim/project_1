import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/screens/detail_screen.dart';
import 'package:test_app/widgets/appBar.dart';
import 'package:test_app/widgets/app_drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_app/widgets/card_containers/mini_homeScreen_container_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController? mapController;
  bool showBottomSheett = true;
  bool showKudaInput = true;
  LatLng _currentLocation = const LatLng(42.869937, 74.590002);
  BitmapDescriptor? customIcon;
  Set<Marker> markers = {};
  @override
  void initState() {
    super.initState();
    markers = Set.from([]);
  }

  createMarker(context) {
    if (customIcon == null) {
      ImageConfiguration configuration = createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(configuration, Images.mapMarker,
              mipmaps: true)
          .then((icon) {
        setState(() {
          customIcon = icon;
        });
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void dispose() {
    mapController!.dispose();
    super.dispose();
  }

  void callBack(bool showKudaInputt) {
    if (mounted) {
      setState(() {
        showKudaInput = showKudaInputt;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    createMarker(context);
    return Scaffold(
      // key: _scaffoldKey,
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Image.asset('assets/images/hamburger'),
      //     onPressed: () => _scaffoldKey.currentState?.openDrawer(),
      //   ),
      // ),
      appBar: AppBarWidget('showBurger'),
      drawer: AppDrawer(),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            child: GoogleMap(
              markers: markers,
              buildingsEnabled: true,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              onCameraMoveStarted: () {
                setState(() {
                  showBottomSheett = false;
                });
              },
              onTap: (pos) {
                Marker m = Marker(
                    draggable: true,
                    anchor: const Offset(50, 1.0),
                    markerId: MarkerId('1'),
                    icon: customIcon!,
                    position: pos);
                setState(() {
                  markers.add(m);
                  showBottomSheett = true;
                });
              },
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
                          MiniContainerWidget(Images.miniContainer1, 'Газели',
                              true, true, callBack),
                          MiniContainerWidget(Images.miniContainer2, 'Грузчики',
                              false, false, callBack),
                          MiniContainerWidget(Images.miniContainer3,
                              'Эвакуаторы', true, false, callBack),
                          MiniContainerWidget(Images.miniContainer4,
                              'Спецтехника', false, false, callBack),
                        ],
                      ),
                      SizedBox(height: 15),
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
                await Get.to(() => DetailScreen());
              },
              child: const Text("Продолжить"),
            ),
          ),
        ],
      ),
    );
  }
}
