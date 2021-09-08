import 'package:ekinoks_elektron/ekranlar/isletme/isletme_sayfasi.dart';
import 'package:ekinoks_elektron/ekranlar/isletme/isletme_urunleri.dart';
import 'package:ekinoks_elektron/ekranlar/kayit.dart';
import 'package:ekinoks_elektron/firebaseislemleri/firebaseislemleri.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

TextEditingController? _magazaKonum;
TextEditingController? _tckimlik;
TextEditingController? _magazailtisim;
TextEditingController? _magazahakkinda;
TextEditingController? _magazaisim;

class IsletmeKayit extends StatefulWidget {
  String? isim;
  String? soyisim;

  IsletmeKayit(this.isim, this.soyisim);

  @override
  _IsletmeKayitState createState() => _IsletmeKayitState();
}

class _IsletmeKayitState extends State<IsletmeKayit> {
  @override
  void initState() {
    _magazaKonum = TextEditingController();
    _tckimlik = TextEditingController();
    _magazaisim = TextEditingController();
    _magazailtisim = TextEditingController();
    _magazahakkinda = TextEditingController();
    String? isim;
    String? soyisim;

    super.initState();
  }

  @override
  void dispose() {
    _magazaKonum?.dispose();
    _magazaisim?.dispose();
    _tckimlik?.dispose();
    _magazahakkinda?.dispose();
    _magazailtisim?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print(user!.uid);
          },
        ),
        appBar: AppBar(
          title: Text(
            "Create Your Store",
            style: TextStyle(fontSize: 18),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _magazaisim,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: "Mağaza Adın",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _magazaKonum,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: "Mağaza Adresin",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _tckimlik,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: "TC kimlik Numaran",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _magazahakkinda,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: "Mağaza Hakkında",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _magazailtisim,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: "Mağaza İrtibat",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 33,
                child: ElevatedButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      FbMagazaKayitEkle(
                          user!.uid,
                          _magazaisim!.text,
                          _magazaKonum!.text,
                          _tckimlik!.text,
                          _magazailtisim!.text,
                          _magazahakkinda!.text);
                      Fluttertoast.showToast(
                          msg: "Kaydedildi",
                          backgroundColor: Colors.green,
                          gravity: ToastGravity.CENTER);
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => IsletmeProfil()),
                          (route) => false);
                    },
                    child: Text("Kaydet"),
                    style: ElevatedButton.styleFrom(primary: Colors.black)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
