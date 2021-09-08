import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';

class KartEklemeSayfasi extends StatelessWidget {
  const KartEklemeSayfasi({Key? key}) : super(key: key);

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
                        obscureText: true,
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
                        obscureText: true,
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
                        obscureText: true,
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
                        obscureText: true,
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
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 100),
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: GestureDetector(
                    onTap: () {},
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
