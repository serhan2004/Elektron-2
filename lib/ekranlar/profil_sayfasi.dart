import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekinoks_elektron/ekranlar/ayarlar.dart';
import 'package:ekinoks_elektron/ekranlar/harita.dart';
import 'package:ekinoks_elektron/ekranlar/karekod.dart';
import 'package:ekinoks_elektron/ekranlar/kart_sayfasi.dart';
import 'package:ekinoks_elektron/ekranlar/kayit.dart';
import 'package:ekinoks_elektron/ekranlar/pfotodegis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekinoks_elektron/firebaseislemleri/getx/getxislemleri.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'kayit.dart';

ppfotocontroller profilfotosu = Get.put(ppfotocontroller());

class ProfilSayfasi extends StatefulWidget {
  ProfilSayfasi();

  @override
  _ProfilSayfasiState createState() => _ProfilSayfasiState();
}

var scaffoldKey = GlobalKey<ScaffoldState>();

class _ProfilSayfasiState extends State<ProfilSayfasi> {
  ppfotokontrol() async {
    setState(() async {
      DocumentSnapshot kisibilgi = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user!.uid)
          .get();
      profilfotosu.ppfotolink = kisibilgi["profilfotolink"].toString();
    });
  }

  @override
  void initState() {
    super.initState();
    ppfotokontrol();
  }

  @override
  Widget build(BuildContext context) {
    int currentMoney = 1000;
    int oldMoney = 5000;

    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          backgroundColor: Color.fromARGB(
              255, 18, 42, 82), //Color.fromARGB(255, 41, 75, 147),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          )),
      drawer: Drawer(
          child: ListView(children: [
        Container(
          height: 70,
          child: const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 18, 42, 82),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Pages"),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.qr_code),
          title: const Text("QR code scanner"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => KarekodSayfasi()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.map),
          title: const Text("Map"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HaritaSayfasi()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.credit_card),
          title: const Text("Credit Cards"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Kredikartisayfasi()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Settings"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AyarlarSayfasi()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text("Sign Out"),
          onTap: () {
            auth.signOut();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Kayitsayfasi()),
            );
          },
        ),
      ])),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Color.fromARGB(255, 18, 42, 82),
              //color: Colors.blue.shade800,
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onLongPress: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => ProfilFotosuDegismeSayfasi()));
                    },
                    child: Obx(() => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 60.0,
                            backgroundImage:
                                NetworkImage(profilfotosu.ppfotolink),
                            backgroundColor: Colors.transparent,
                          ),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "asdads",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            Container(
              //color: Color.fromARGB(50, 245, 234, 196),
              color: Color.fromARGB(255, 244, 240, 236),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Card Balance"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SfLinearGauge(
                      barPointers: [
                        LinearBarPointer(value: oldMoney.toDouble())
                      ],
                      maximum: oldMoney.toDouble(),
                      markerPointers: [
                        LinearShapePointer(value: currentMoney.toDouble())
                      ],
                      ranges: [
                        LinearGaugeRange(
                          startValue: 0,
                          endValue: currentMoney.toDouble(),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Center(
                    child: Text(
                      "Your purchase history",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          wordSpacing: 2,
                          letterSpacing: 3),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Containericerik extends StatelessWidget {
  String _yazi;
  Icon _icon;
  Containericerik(
    this._yazi,
    this._icon,
  );
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: _icon,
          ),
          Text(
            _yazi,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
