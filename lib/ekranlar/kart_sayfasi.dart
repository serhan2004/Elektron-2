import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ekinoks_elektron/ekranlar/Kart_ekleme_sayfasi.dart';
import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'Kart_ekleme_sayfasi.dart';

class Kredikartisayfasi extends StatefulWidget {
  @override
  _KredikartisayfasiState createState() => _KredikartisayfasiState();
}

class _KredikartisayfasiState extends State<Kredikartisayfasi> {
  Future fetchListeleKart() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => KartEklemeSayfasi()));
        },
        label: Text("Add Card"),
        icon: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 18, 42, 82), //Colors.indigo,
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 18, 42, 82), //Colors.indigo,
        title: TextLiquidFill(
          loadDuration: Duration(seconds: 5),
          waveDuration: Duration(seconds: 2),
          waveColor: Colors.white,
          boxBackgroundColor: Color.fromARGB(255, 18, 42, 82), //Colors.indigo,
          text: "Your Cards",
          boxHeight: 50,
          boxWidth: 200,
          textStyle: TextStyle(fontSize: 25),
        ),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                CreditCard(
                    cardNumber: "550 7879 4864 7854",
                    cardExpiry: "10/25",
                    cardHolderName: "Card Holder",
                    cvv: "456",
                    bankName: "Axis Bank",
                    cardType: CardType
                        .masterCard, // Optional if you want to override Card Type
                    showBackSide: false,
                    frontBackground: CardBackgrounds.black,
                    backBackground: CardBackgrounds.white,
                    showShadow: true,
                    textExpDate: 'Exp. Date',
                    textName: 'Name',
                    textExpiry: 'MM/YY'),
                SizedBox(
                  height: 10,
                )
              ],
            );
          }),
    );
  }
}
