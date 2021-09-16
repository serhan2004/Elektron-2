import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HaritaSayfasi extends StatefulWidget {
  const HaritaSayfasi({Key? key}) : super(key: key);

  @override
  _HaritaSayfasiState createState() => _HaritaSayfasiState();
}

class _HaritaSayfasiState extends State<HaritaSayfasi> {
  Set<Marker> _markers = {};
  var tarihiMarker;
  var camimarker;
  var trenmarker;
  var eczmarker;

  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }

  Future<void> setCustomMarker() async {
    tarihiMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(5, 5)),
        "assets/markers/tarihi_marker.png");

    camimarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(10, 10)), "assets/markers/mosque.png");

    trenmarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(10, 10)), "assets/markers/train.png");

    eczmarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(10, 10)), "assets/markers/eczane.png");
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("Id-1"),
            position: LatLng(41.02569414363595, 28.974166688314174),
            icon: tarihiMarker,
            infoWindow: InfoWindow(
              title: "Galata Tower",
            ),
            visible: true),
      );
      _markers.add(Marker(
          markerId: MarkerId("Id-2"),
          position: LatLng(41.00540250566176, 28.97681618188754),
          icon: camimarker,
          infoWindow: InfoWindow(
            title: "The Blue Mosque",
          ),
          visible: true));
      _markers.add(Marker(
          markerId: MarkerId("Id-3"),
          position: LatLng(41.00859070323684, 28.980172176274984),
          icon: camimarker,
          infoWindow: InfoWindow(
            title: "The Hagia Sophia Mosque",
          ),
          visible: true));
      _markers.add(Marker(
          markerId: MarkerId("Id-4"),
          position: LatLng(41.011527777848976, 28.98337847003785),
          icon: tarihiMarker,
          infoWindow: InfoWindow(
            title: "Topkapı Palace",
          ),
          visible: true));
      _markers.add(Marker(
          markerId: MarkerId("Id-5"),
          position: LatLng(41.010689655546386, 28.968067792686316),
          icon: tarihiMarker,
          infoWindow: InfoWindow(
            title: "Grand Bazaar",
          ),
          visible: true));
      _markers.add(Marker(
          markerId: MarkerId("Id-6"),
          position: LatLng(41.00836267655452, 28.977839908103757),
          icon: tarihiMarker,
          infoWindow: InfoWindow(
            title: "Basilica Cistern",
          ),
          visible: true));
      _markers.add(Marker(
          markerId: MarkerId("Id-7"),
          position: LatLng(41.03378328974789, 28.97793533842894),
          icon: tarihiMarker,
          infoWindow: InfoWindow(
            title: "Istiklal Street",
          ),
          visible: true));
      _markers.add(Marker(
          markerId: MarkerId("Id-8"),
          position: LatLng(41.08481909539014, 29.056695817856847),
          icon: tarihiMarker,
          infoWindow: InfoWindow(
            title: "Rumeli Fortress",
          ),
          visible: true));
      _markers.add(Marker(
          markerId: MarkerId("Id-9"),
          position: LatLng(41.08593296036114, 29.07072135440755),
          icon: tarihiMarker,
          infoWindow: InfoWindow(
            title: "Anatolian Fortress",
          ),
          visible: true));
      _markers.add(Marker(
          markerId: MarkerId("Id-10"),
          position: LatLng(40.99385959578696, 28.923269417022766),
          icon: tarihiMarker,
          infoWindow: InfoWindow(
            title: "Yedikule Dungeons",
          ),
          visible: true));
      _markers.add(Marker(
          markerId: MarkerId("Id-11"),
          position: LatLng(40.99682677560662, 29.01929413252782),
          icon: trenmarker,
          infoWindow: InfoWindow(
            title: "Haydarpasa Train Station",
          ),
          visible: true));
      _markers.add(Marker(
          markerId: MarkerId("Id-12"),
          position: LatLng(41.0391644201605, 29.00045765709285),
          icon: tarihiMarker,
          infoWindow: InfoWindow(
            title: "Dolmabahçe Palace",
          ),
          visible: true));
    });
    _markers.add(
      Marker(
          markerId: MarkerId("Id-13"),
          position: LatLng(41.007118, 28.972157),
          icon: eczmarker,
          infoWindow: InfoWindow(
            title: "Pharmacy",
          ),
          visible: true),
    );
    _markers.add(
      Marker(
          markerId: MarkerId("Id-14"),
          position: LatLng(41.025266, 28.977352),
          icon: eczmarker,
          infoWindow: InfoWindow(
            title: "Pharmacy",
          ),
          visible: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "Pocket Map",
                  speed: const Duration(milliseconds: 200),
                )
              ],
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          markers: _markers,
          initialCameraPosition: CameraPosition(
              target: LatLng(41.02654005646009, 28.97487926883292),
              zoom: 10,
              tilt: 40),
          scrollGesturesEnabled: true,
          tiltGesturesEnabled: true,
        ),
      ),
    );
  }
}
