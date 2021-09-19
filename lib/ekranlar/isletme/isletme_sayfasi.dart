import 'package:ekinoks_elektron/ekranlar/harita.dart';
import 'package:ekinoks_elektron/ekranlar/isletme/isletmedetay/urunsayfasi.dart';
import 'package:ekinoks_elektron/ekranlar/kayit.dart';
import 'package:ekinoks_elektron/firebaseislemleri/getx/getxislemleri.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ekinoks_elektron/ekranlar/ayarlar.dart';
import 'package:ekinoks_elektron/ekranlar/karekod.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

ppfotocontroller ppfotosu = Get.put(ppfotocontroller());
var scaffoldKey = GlobalKey<ScaffoldState>();

class IsletmeProfil extends StatefulWidget {
  @override
  _IsletmeProfilState createState() => _IsletmeProfilState();
}

class _IsletmeProfilState extends State<IsletmeProfil> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 18, 42, 82),
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
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Color.fromARGB(
                    255, 18, 42, 82), //Color.fromARGB(255, 41, 75, 147),
                //color: Colors.blue.shade800,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Bakiyen : " + " 0" + "₺",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: NetworkImage(
                              "https://cdn4.vectorstock.com/i/1000x1000/08/28/shop-store-flat-icon-vector-14270828.jpg"),
                          radius: 60,
                        )),
                    Text(
                      auth.currentUser!.displayName.toString(),
                      style: TextStyle(fontSize: 16, color: Colors.white),
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Card(
                        elevation: 10,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UrunSayfasi()));
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 119, 136, 153),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Containericerik(
                                "Ürünler",
                                Icon(
                                  Icons.list,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                        clipBehavior: Clip.antiAlias,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (c) => HaritaSayfasi()));
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
                                color: Color.fromARGB(255, 119, 136, 153),
                                borderRadius: BorderRadius.circular(5)),
                            child: Containericerik(
                                "Ayarlar", Icon(Icons.settings)),
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
                                "Çıkış Yap", Icon(Icons.exit_to_app_rounded)),
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
