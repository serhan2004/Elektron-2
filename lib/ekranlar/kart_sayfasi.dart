import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

class Kredikartisayfasi extends StatefulWidget {
  const Kredikartisayfasi({Key? key}) : super(key: key);

  @override
  _KredikartisayfasiState createState() => _KredikartisayfasiState();
}

class _KredikartisayfasiState extends State<Kredikartisayfasi> {
  bool _sayfacevir = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text("Add Card"),
          icon: Icon(Icons.add),
          backgroundColor: Colors.black,
        ),
        appBar: AppBar(
          title: Text("My Cards"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onLongPress: () {
                  setState(() {
                    HapticFeedback.lightImpact();
                    Fluttertoast.showToast(
                        msg: "Selected",
                        fontSize: 18,
                        backgroundColor: Colors.green,
                        gravity: ToastGravity.CENTER,
                        toastLength: Toast.LENGTH_SHORT,
                        textColor: Colors.black);
                  });
                },
                onTap: () {
                  setState(() {
                    _sayfacevir == false
                        ? _sayfacevir = true
                        : _sayfacevir = false;
                  });
                },
                child: Row(
                  children: [
                    CreditCard(
                      cardNumber: "5450 7879 464 7854",
                      cardExpiry: "10/25",
                      cardHolderName: "Serhan Ergül",
                      cvv: "123",
                      bankName: "ElectronBank",
                      cardType: CardType
                          .masterCard, // Optional if you want to override Card Type
                      showBackSide: _sayfacevir,
                      frontBackground: CardBackgrounds.black,
                      backBackground: CardBackgrounds.white,
                      showShadow: true,
                      textExpDate: 'Skt',
                      textName: 'Name',
                      textExpiry: 'MM/YY',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
