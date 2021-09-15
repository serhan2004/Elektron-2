import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:ekinoks_elektron/firebaseislemleri/firebaseislemleri.dart';
import 'package:ekinoks_elektron/ekranlar/kayit.dart';

class UrunSayfasi extends StatefulWidget {
  const UrunSayfasi({Key? key}) : super(key: key);

  @override
  _UrunSayfasiState createState() => _UrunSayfasiState();
}

class _UrunSayfasiState extends State<UrunSayfasi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (c) => Urunekle()));
          },
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("Ürünlerin"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

class Urunekle extends StatefulWidget {
  @override
  UrunekleState createState() => UrunekleState();
}

class UrunekleState extends State<Urunekle> {
  TextEditingController _urunIsim = TextEditingController();
  TextEditingController _urunKategori = TextEditingController();
  TextEditingController _stt = TextEditingController();
  TextEditingController _stok = TextEditingController();
  TextEditingController _fiyat = TextEditingController();
  @override
  void initState() {
    _urunIsim = TextEditingController();
    _urunKategori = TextEditingController();
    _stt = TextEditingController();
    _stok = TextEditingController();
    _fiyat = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Container(
          height: 50,
          width: 200,
          child: Center(
            child: TextLiquidFill(
              loadDuration: Duration(seconds: 5),
              waveDuration: Duration(seconds: 2),
              waveColor: Colors.orange,
              boxBackgroundColor: Colors.indigo,
              text: "Ürün Ekle",
              boxHeight: 50,
              boxWidth: 200,
              textStyle: TextStyle(fontSize: 25),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  controller: _urunIsim,
                  decoration: InputDecoration(
                    hintText: "Ürün Adı | Akıllı saat",
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  controller: _urunKategori,
                  decoration: InputDecoration(
                    hintText: "Ürün Kategorisi | Giyecek,Gıda...",
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  controller: _stt,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      hintText: "Varsa son tüketim tarihi, Yok ise 0 "),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  controller: _fiyat,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Fiyat ₺"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  controller: _stok,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Stok"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width - 10,
                  child: ElevatedButton(
                      onPressed: () {
                        FbStoreUrunekle(user!.uid, _urunIsim, _urunKategori,
                            _stt, _stok, _fiyat);
                        Vibration.vibrate(duration: 1);
                        Navigator.pop(context);
                      },
                      child: Text("Kaydet")))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _urunIsim.dispose();
    _stok.dispose();
    _urunKategori.dispose();
    _stt.dispose();
    _fiyat.dispose();
    super.dispose();
  }
}
