import 'package:ekinoks_elektron/ekranlar/ayarlar.dart';
import 'package:ekinoks_elektron/ekranlar/harita.dart';
import 'package:ekinoks_elektron/ekranlar/kart_sayfasi.dart';
import 'package:ekinoks_elektron/ekranlar/kayit.dart';
import 'package:ekinoks_elektron/ekranlar/pfotodegis.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

String ProfilFotoLinki =
    'https://i.pinimg.com/originals/f9/e4/d9/f9e4d92f175e120ac1840a29095e3646.jpg';

class ProfilSayfasi extends StatefulWidget {
  ProfilSayfasi();

  @override
  _ProfilSayfasiState createState() => _ProfilSayfasiState();
}

class _ProfilSayfasiState extends State<ProfilSayfasi> {
  @override
  Widget build(BuildContext context) {
    int currentMoney = 1000;
    int oldMoney = 5000;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Color.fromARGB(255, 41, 75, 147),
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
                                builder: (b) => ProfilFotosuDegismeSayfasi()));
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 60.0,
                            backgroundImage: NetworkImage(ProfilFotoLinki),
                            backgroundColor: Colors.transparent,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Card(
                        elevation: 10,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HaritaSayfasi()));
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 119, 136, 153),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Containericerik(
                                "Credit Cards",
                                Icon(
                                  Icons.credit_card,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                        clipBehavior: Clip.antiAlias,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Card(
                        elevation: 10,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Kredikartisayfasi()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 80,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 119, 136, 153),
                                borderRadius: BorderRadius.circular(5)),
                            child: Containericerik(
                                "Map", Icon(Icons.map_outlined)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Card(
                        elevation: 10,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => AyarlarSayfasi()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 80,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 119, 136, 153),
                                borderRadius: BorderRadius.circular(5)),
                            child: Containericerik(
                                "Settings", Icon(Icons.settings)),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        auth.signOut();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Kayitsayfasi()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Card(
                          elevation: 10,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 80,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 145, 163, 176),
                                borderRadius: BorderRadius.circular(5)),
                            child: Containericerik(
                                "SignOut", Icon(Icons.exit_to_app_rounded)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 300,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
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
