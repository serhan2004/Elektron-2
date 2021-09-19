import 'karekod_turist.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

double toplamtutar = 0;
String? satin_alinanMagaza = parantezsiz_result[0].toString();
List<UrunListelemeModeli> UrunModelListesi = [];

class OdemeSayfasi extends StatelessWidget {
  const OdemeSayfasi({Key? key}) : super(key: key);

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
                  width: double.infinity,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        "Total amount  ",
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
    for (int i = 0; i <= parantezsiz_result.length; i++) {
      if (i > 0) {
        switch (parantezsiz_result[i]) {
          case "Vazo":
            UrunListelemeModeli Vazo =
                UrunListelemeModeli("Vase", "Murano Küçük Vazo", 449);
            UrunModelListesi.add(Vazo);
            break;
          case "Bisiklet":
            UrunListelemeModeli Bisiklet =
                UrunListelemeModeli("Biycycle", "Mosso Legarda", 2800);
            UrunModelListesi.add(Bisiklet);
            break;
          case "Kupe":
            UrunListelemeModeli Kupe = UrunListelemeModeli("Earring",
                "Swarovski Kadın Beyaz Rodyum Kaplama Tennis Dlxmc Küpe", 725);
            UrunModelListesi.add(Kupe);
            break;
          case "Deodorant":
            UrunListelemeModeli Deodorant = UrunListelemeModeli(
                "Deodorant", "Sebamed Aerosol Deodorant Fresh 150 Ml", 25);
            UrunModelListesi.add(Deodorant);
            break;
          case "Smartwatch":
            UrunListelemeModeli AkilliSaat = UrunListelemeModeli(
                "Smart Watch", "VESTEL Akıllı Saat Mavi", 249);
            UrunModelListesi.add(AkilliSaat);
            break;
          case "Cikolata":
            UrunListelemeModeli Cikolata = UrunListelemeModeli(
                "Chocolate", "Beyoğlu Çikolatası 250 gr", 45);
            UrunModelListesi.add(Cikolata);
            break;
        }
      }
    }
  }
}

/* Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  title: Text("Bicycle"),
                  subtitle: Text("Kron Nomad 4.0  ₺2.000  "),
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
