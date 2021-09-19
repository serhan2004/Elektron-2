import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekinoks_elektron/ekranlar/Kart_ekleme_sayfasi.dart';
import 'package:ekinoks_elektron/ekranlar/kayit.dart';
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
  bool _kartiCevir = false;
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
      body: Column(
        children: [
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection("CreditCards")
                .doc(user!.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot asyncSnapshot) {
              if (asyncSnapshot.data.data() != null) {
                var liste_elemanlari =
                    asyncSnapshot.data.data().values.elementAt(0).values;
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          if (_kartiCevir == false) {
                            setState(() {
                              _kartiCevir = true;
                            });
                          } else {
                            setState(() {
                              _kartiCevir = false;
                            });
                          }
                        },
                        child: CreditCard(
                          cardNumber: liste_elemanlari.elementAt(1).toString(),
                          cardExpiry: liste_elemanlari.elementAt(3).toString(),
                          cardHolderName:
                              liste_elemanlari.elementAt(2).toString(),
                          cvv: liste_elemanlari.elementAt(0).toString(),
                          bankName: "Electron Bank",
                          cardType: CardType
                              .masterCard, // Optional if you want to override Card Type
                          showBackSide: _kartiCevir,
                          frontBackground: CardBackgrounds.black,
                          backBackground: CardBackgrounds.white,
                          showShadow: true,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: Text("You don't have a card"));
              }
            },
          ),
        ],
      ),
    );
  }
}
