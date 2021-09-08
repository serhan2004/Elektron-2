import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HaritaSayfasi extends StatefulWidget {
  const HaritaSayfasi({Key? key}) : super(key: key);

  @override
  _HaritaSayfasiState createState() => _HaritaSayfasiState();
}

class _HaritaSayfasiState extends State<HaritaSayfasi> {
  Set<Marker> _markers = {
    Marker(
        markerId: MarkerId("Id-3"),
        position: LatLng(41.00859070323684, 28.980172176274984),
        infoWindow: InfoWindow(
          title: "The Hagia Sophia Mosque",
        ),
        visible: true),
    /*
    Marker(
        markerId: MarkerId("Id-2"),
        position: LatLng(41.00540250566176, 28.97681618188754),
        infoWindow: InfoWindow(
          title: "The Blue Mosque",
        ),
        visible: true),
    Marker(
        markerId: MarkerId("Id-4"),
        position: LatLng(41.011527777848976, 28.98337847003785),
        infoWindow: InfoWindow(
          title: "Topkapı Palace",
        ),
        visible: true),
    Marker(
        markerId: MarkerId("Id-5"),
        position: LatLng(41.010689655546386, 28.968067792686316),
        infoWindow: InfoWindow(
          title: "Grand Bazaar",
        ),
        visible: true),
    Marker(
        markerId: MarkerId("Id-6"),
        position: LatLng(41.00836267655452, 28.977839908103757),
        infoWindow: InfoWindow(
          title: "Basilica Cistern",
        ),
        visible: true),
    Marker(
        markerId: MarkerId("Id-7"),
        position: LatLng(41.03378328974789, 28.97793533842894),
        infoWindow: InfoWindow(
          title: "Istiklal Street",
        ),
        visible: true),
    Marker(
        markerId: MarkerId("Id-8"),
        position: LatLng(41.08481909539014, 29.056695817856847),
        infoWindow: InfoWindow(
          title: "Rumeli Fortress",
        ),
        visible: true),
    Marker(
        markerId: MarkerId("Id-9"),
        position: LatLng(41.08593296036114, 29.07072135440755),
        infoWindow: InfoWindow(
          title: "Anatolian Fortress",
        ),
        visible: true),
    Marker(
        markerId: MarkerId("Id-10"),
        position: LatLng(40.99385959578696, 28.923269417022766),
        infoWindow: InfoWindow(
          title: "Yedikule Dungeons",
        ),
        visible: true),
    Marker(
        markerId: MarkerId("Id-11"),
        position: LatLng(40.99682677560662, 29.01929413252782),
        infoWindow: InfoWindow(
          title: "Haydarpasa Train Station",
        ),
        visible: true),
    Marker(
        markerId: MarkerId("Id-12"),
        position: LatLng(41.0391644201605, 29.00045765709285),
        infoWindow: InfoWindow(
          title: "Dolmabahçe Palace",
        ),
        visible: true),
        */
  };

  void _onMapCreated(GoogleMapController controller) {
    setState(() async {
      _markers.add(
        Marker(
            markerId: MarkerId("Id-1"),
            position: LatLng(41.02569414363595, 28.974166688314174),
            icon: await BitmapDescriptor.fromAssetImage(
                ImageConfiguration(size: Size(10, 10)),
                'assets/markers/tarihi_marker.png'),
            infoWindow: InfoWindow(
              title: "Galata Tower",
            ),
            visible: true),
      );
      _markers.add(Marker(
          markerId: MarkerId("Id-2"),
          position: LatLng(41.00540250566176, 28.97681618188754),
          icon: await BitmapDescriptor.fromAssetImage(
              ImageConfiguration(size: Size(10, 10)),
              'assets/markers/tarihi_marker.png'),
          infoWindow: InfoWindow(
            title: "The Blue Mosque",
          ),
          visible: true));

      _markers.add(Marker(
          markerId: MarkerId("Id-3"),
          position: LatLng(41.00859070323684, 28.980172176274984),
          icon: await BitmapDescriptor.fromAssetImage(
              ImageConfiguration(size: Size(10, 10)),
              'assets/markers/tarihi_marker.png'),
          infoWindow: InfoWindow(
            title: "The Hagia Sophia Mosque",
          ),
          visible: true));
      _markers.add(Marker(
          markerId: MarkerId("Id-4"),
          position: LatLng(41.011527777848976, 28.98337847003785),
          icon: await BitmapDescriptor.fromAssetImage(
              ImageConfiguration(size: Size(10, 10)),
              'assets/markers/tarihi_marker.png'),
          infoWindow: InfoWindow(
            title: "Topkapı Palace",
          ),
          visible: true));

      _markers.add(Marker(
          markerId: MarkerId("Id-5"),
          position: LatLng(41.010689655546386, 28.968067792686316),
          icon: await BitmapDescriptor.fromAssetImage(
              ImageConfiguration(size: Size(10, 10)),
              'assets/markers/tarihi_marker.png'),
          infoWindow: InfoWindow(
            title: "Grand Bazaar",
          ),
          visible: true));

      _markers.add(Marker(
          markerId: MarkerId("Id-6"),
          position: LatLng(41.00836267655452, 28.977839908103757),
          icon: await BitmapDescriptor.fromAssetImage(
              ImageConfiguration(size: Size(10, 10)),
              'assets/markers/tarihi_marker.png'),
          infoWindow: InfoWindow(
            title: "Basilica Cistern",
          ),
          visible: true));

      _markers.add(Marker(
          markerId: MarkerId("Id-7"),
          position: LatLng(41.03378328974789, 28.97793533842894),
          icon: await BitmapDescriptor.fromAssetImage(
              ImageConfiguration(size: Size(10, 10)),
              'assets/markers/tarihi_marker.png'),
          infoWindow: InfoWindow(
            title: "Istiklal Street",
          ),
          visible: true));

      _markers.add(Marker(
          markerId: MarkerId("Id-8"),
          position: LatLng(41.08481909539014, 29.056695817856847),
          icon: await BitmapDescriptor.fromAssetImage(
              ImageConfiguration(size: Size(10, 10)),
              'assets/markers/tarihi_marker.png'),
          infoWindow: InfoWindow(
            title: "Rumeli Fortress",
          ),
          visible: true));

      _markers.add(Marker(
          markerId: MarkerId("Id-9"),
          position: LatLng(41.08593296036114, 29.07072135440755),
          icon: await BitmapDescriptor.fromAssetImage(
              ImageConfiguration(size: Size(10, 10)),
              'assets/markers/tarihi_marker.png'),
          infoWindow: InfoWindow(
            title: "Anatolian Fortress",
          ),
          visible: true));

      _markers.add(Marker(
          markerId: MarkerId("Id-10"),
          position: LatLng(40.99385959578696, 28.923269417022766),
          icon: await BitmapDescriptor.fromAssetImage(
              ImageConfiguration(size: Size(10, 10)),
              'assets/markers/tarihi_marker.png'),
          infoWindow: InfoWindow(
            title: "Yedikule Dungeons",
          ),
          visible: true));

      _markers.add(Marker(
          markerId: MarkerId("Id-11"),
          position: LatLng(40.99682677560662, 29.01929413252782),
          icon: await BitmapDescriptor.fromAssetImage(
              ImageConfiguration(size: Size(10, 10)),
              'assets/markers/tarihi_marker.png'),
          infoWindow: InfoWindow(
            title: "Haydarpasa Train Station",
          ),
          visible: true));

      _markers.add(Marker(
          markerId: MarkerId("Id-12"),
          position: LatLng(41.0391644201605, 29.00045765709285),
          icon: await BitmapDescriptor.fromAssetImage(
              ImageConfiguration(size: Size(10, 10)),
              'assets/markers/tarihi_marker.png'),
          infoWindow: InfoWindow(
            title: "Dolmabahçe Palace",
          ),
          visible: true));
    });
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
                  "Google Haritalar",
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
