import 'package:awesome_card/awesome_card.dart';
import 'package:ekinoks_elektron/firebaseislemleri/firebaseislemleri.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'kayit.dart';
import 'package:flutter/material.dart';

List<kartData> kartlarim = [];

class KartEklemeSayfasi extends StatefulWidget {
  const KartEklemeSayfasi({Key? key}) : super(key: key);
  @override
  _KartEklemeSayfasiState createState() => _KartEklemeSayfasiState();
}

class _KartEklemeSayfasiState extends State<KartEklemeSayfasi> {
  User? _user = auth.currentUser;
  TextEditingController _cardHolderName = TextEditingController();
  TextEditingController _cardNumbers = TextEditingController();
  TextEditingController _cardCVV = TextEditingController();
  TextEditingController _cardExpriy = TextEditingController();
  TextEditingController _kartismi = TextEditingController();

  @override
  void dispose() {
    _cardCVV.dispose();
    _cardHolderName.dispose();
    _cardExpriy.dispose();
    _cardNumbers.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CreditCard(
                  cardNumber: "5450 7879 4864 784",
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
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(140, 0, 0, 0),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _kartismi,
                        obscureText: false,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              letterSpacing: 2,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400),
                          hintText: "Your Card Name",
                          border: InputBorder.none,
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(140, 0, 0, 0),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _cardHolderName,
                        obscureText: false,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              letterSpacing: 2,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400),
                          hintText: "Card Holder Name",
                          border: InputBorder.none,
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(140, 0, 0, 0),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _cardNumbers,
                        obscureText: false,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              letterSpacing: 2,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400),
                          hintText: "Card Numbers",
                          border: InputBorder.none,
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(140, 0, 0, 0),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _cardCVV,
                        obscureText: false,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              letterSpacing: 2,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400),
                          hintText: "CVV",
                          border: InputBorder.none,
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(140, 0, 0, 0),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _cardExpriy,
                        obscureText: false,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              letterSpacing: 2,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400),
                          hintText: "Card Expiry",
                          border: InputBorder.none,
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(140, 0, 0, 0),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              letterSpacing: 2,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400),
                          hintText: "Password",
                          border: InputBorder.none,
                        ),
                      ),
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      FbKullaniciKartEkle(user!.uid, _kartismi, _cardHolderName,
                          _cardNumbers, _cardCVV, _cardExpriy);
                      kartlarim.add(kartData(
                          _cardHolderName.text.toString(),
                          _kartismi.text.toString(),
                          _cardExpriy.text.toString(),
                          int.parse(_cardCVV.text),
                          int.parse(_cardNumbers.text)));

                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Text(
                        "Add Card",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class kartData {
  String? _Kartisim;
  String? _KartSahibi;
  int? _kartNumaralari;
  int? _cvv;
  String? _cardexpriy;

  kartData(this._KartSahibi, this._Kartisim, this._cardexpriy, this._cvv,
      this._kartNumaralari);
}
