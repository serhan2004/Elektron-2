import 'package:ekinoks_elektron/ekranlar/kayit.dart';
import 'package:ekinoks_elektron/firebaseislemleri/firebaseislemleri.dart';
import 'package:flutter/services.dart';

import 'karekod_turist.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

double toplamtutar = 0;
String? satin_alinanMagaza = parantezsiz_result[0].trim();

class OdemeSayfasi extends StatefulWidget {
  @override
  _OdemeSayfasiState createState() => _OdemeSayfasiState();
}

class _OdemeSayfasiState extends State<OdemeSayfasi> {
  List<UrunListelemeModeli> UrunModelListesi = [];
  @override
  void initState() {
    super.initState();
    UrunListesiToModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Verify Your Shopping",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/onay.png"),
                fit: BoxFit.scaleDown)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Container(
                  height: 550,
                  child: ListView.builder(
                      itemCount: UrunModelListesi.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.grey.shade50,
                            elevation: 10,
                            child: ListTile(
                              title: Text(UrunModelListesi[index].isim),
                              subtitle: Text(UrunModelListesi[index].subtitle +
                                  " " +
                                  UrunModelListesi[index].price.toString()),
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        "Total amount $toplamtutar ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Vibration.vibrate(duration: 150);
                          SystemNavigator.pop();
                        },
                        child: Text("Cancel"),
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 40,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Vibration.vibrate(duration: 150);
                          FbOdemeTamamlama(user!.uid, toplamtutar,
                              satin_alinanMagaza.toString());
                        },
                        child: Text("Confirm"),
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  void UrunListesiToModel() {
    for (int i = 1; i < parantezsiz_result.length; i++) {
      print(parantezsiz_result[i]);
      switch (parantezsiz_result[i].trim()) {
        case "Vazo":
          UrunListelemeModeli Vazo =
              UrunListelemeModeli("Vase", "Murano K??????k Vazo", 449);
          UrunModelListesi.add(Vazo);
          print("??r??n EKLEND??");
          break;
        case "Bisiklet":
          UrunListelemeModeli Bisiklet =
              UrunListelemeModeli("Biycycle", "Mosso Legarda", 2800);
          UrunModelListesi.add(Bisiklet);
          print("??r??n EKLEND??");

          break;
        case "Kupe":
          UrunListelemeModeli Kupe = UrunListelemeModeli("Earring",
              "Swarovski Kad??n Beyaz Rodyum Kaplama Tennis Dlxmc K??pe", 725);
          UrunModelListesi.add(Kupe);
          print("??r??n EKLEND??");

          break;
        case "Deodorant":
          UrunListelemeModeli Deodorant = UrunListelemeModeli(
              "Deodorant", "Sebamed Aerosol Deodorant Fresh 150 Ml", 25);
          UrunModelListesi.add(Deodorant);
          print("??r??n EKLEND??");

          break;
        case "Smartwatch":
          UrunListelemeModeli AkilliSaat = UrunListelemeModeli(
              "Smart Watch", "VESTEL Ak??ll?? Saat Mavi", 249);
          UrunModelListesi.add(AkilliSaat);
          print("??r??n EKLEND??");

          break;
        case "Cikolata":
          UrunListelemeModeli Cikolata =
              UrunListelemeModeli("Chocolate", "Beyo??lu ??ikolatas?? 250 gr", 45);
          UrunModelListesi.add(Cikolata);
          print("??r??n EKLEND??");
          break;
        case "Baklava":
          UrunListelemeModeli Baklava = UrunListelemeModeli(
              "Baklava", "Antep F??st??kl?? Baklava 1 Tepsi", 130);
          UrunModelListesi.add(Baklava);
          print("??r??n EKLEND??");
          break;
        case "Magnet":
          UrunListelemeModeli Magnet =
              UrunListelemeModeli("Magnet", "T??rk Bayrakl?? Magnet", 10);
          UrunModelListesi.add(Magnet);
          print("??r??n EKLEND??");
          break;
        case "Beypazari":
          UrunListelemeModeli Beypazari =
              UrunListelemeModeli("Maden Suyu", "Beypazar?? Maden Suyu ", 1.5);
          UrunModelListesi.add(Beypazari);
          print("??r??n EKLEND??");
          break;
        case "Soap":
          UrunListelemeModeli Soap =
              UrunListelemeModeli("Soap", "Geleneksel B??tt??m Sabunu", 10);
          UrunModelListesi.add(Soap);
          print("??r??n EKLEND??");
          break;
      }
    }
    for (int i = 0; i < UrunModelListesi.length; i++) {
      toplamtutar = toplamtutar + UrunModelListesi[i].price;
    }
  }
}

/* Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  title: Text("Bicycle"),
                  subtitle: Text("Kron Nomad 4.0  ???2.000  "),
                  trailing: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                elevation: 10,
              ),
            ), */

class UrunListelemeModeli {
  String isim;
  String subtitle;
  double price;
  UrunListelemeModeli(this.isim, this.subtitle, this.price);
}



/*
 padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  title: Text("Bicycle"),
                  subtitle: Text("Kron Nomad 4.0  ???2.000  "),
                  trailing: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                elevation: 10,
              ),
            ),*/