import 'package:ekinoks_elektron/ekranlar/isletme/isletmedetay/%C3%BCr%C3%BCnsayfasi.dart';
import 'package:ekinoks_elektron/ekranlar/kayit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class IsletmeProfil extends StatelessWidget {
  IsletmeProfil();
  @override
  Widget build(BuildContext context) {
    String _name = "Mark";
    String _surname = "Zuckerberg";
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
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
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Bakiyen : " + " 1500" + "₺",
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
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT62M1CCl_tVQhEeIuP4KSjpVJs2f9WinAUpA&usqp=CAU"),
                          radius: 60,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          _surname,
                          style: TextStyle(color: Colors.white),
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
                    Padding(
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
                          child:
                              Containericerik("Ayarlar", Icon(Icons.settings)),
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
