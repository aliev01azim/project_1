import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/screens/detail_screen.dart';

class KudaPoedemScreen extends StatefulWidget {
  const KudaPoedemScreen({Key? key}) : super(key: key);

  @override
  _KudaPoedemScreenState createState() => _KudaPoedemScreenState();
}

class _KudaPoedemScreenState extends State<KudaPoedemScreen> {
  GoogleMapController? mapController;
  bool showBottomSheett = true;
  LatLng _currentLocation = const LatLng(42.869937, 74.590002);
  BitmapDescriptor? customIcon;
  Set<Marker> markers = {};
  final String text = 'пр. Манаса 45';
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

  @override
  Widget build(BuildContext context) {
    createMarker(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
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
                });
              },
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _currentLocation,
                zoom: 15.0,
              ),
            ),
          ),
          if (showBottomSheett)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 161,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '${text}',
                        style: TextStyle(color: Color.fromRGBO(59, 65, 75, 1)),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => DetailScreen());
                        },
                        child: Text('Готово'),
                      )
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
