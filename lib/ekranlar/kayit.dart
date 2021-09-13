import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ekinoks_elektron/ekranlar/giris.dart';
import 'package:ekinoks_elektron/ekranlar/isletme/isletmekayit.dart';
import 'package:ekinoks_elektron/ekranlar/profil_sayfasi.dart';
import 'package:ekinoks_elektron/firebaseislemleri/firebaseislemleri.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

FirebaseAuth auth = FirebaseAuth.instance;
User? user = auth.currentUser;

class Kayitsayfasi extends StatefulWidget {
  const Kayitsayfasi({Key? key}) : super(key: key);

  @override
  _KayitsayfasiState createState() => _KayitsayfasiState();
}

TextEditingController? _name;
TextEditingController? _surname;

TextEditingController? email;
TextEditingController? pass;

class _KayitsayfasiState extends State<Kayitsayfasi> {
  var _formanahtari = GlobalKey<FormState>();

  bool _isletme_mi = false;

  @override
  void initState() {
    email = TextEditingController();
    pass = TextEditingController();
    _name = TextEditingController();
    _surname = TextEditingController();

    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print("Kullanıcı Oturumunu Kapattı");
      } else {
        print("Kullanıcı Oturumunu açtı");
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    email?.dispose();
    pass?.dispose();
    _surname?.dispose();
    _name?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    auth.signOut();
    double _yuvarlanma = 30;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formanahtari,
            child: Center(
              child: Stack(
                children: [
                  Image.asset("assets/images/arkaplan.jpg"),
                  Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        child: AnimatedDefaultTextStyle(
                            child: AnimatedTextKit(animatedTexts: [
                              WavyAnimatedText("Sign Up"),
                              WavyAnimatedText("Now")
                            ]),
                            style: TextStyle(fontSize: 18),
                            duration: const Duration(milliseconds: 300)),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width / 2.2,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(140, 0, 0, 0),
                                    borderRadius:
                                        BorderRadius.circular(_yuvarlanma)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    validator: (alinanisim) {
                                      if (alinanisim!.length < 3) {
                                        return "Can't be shorter than three letters";
                                      } else {
                                        return null;
                                      }
                                    },
                                    cursorColor: Colors.green,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey,
                                          letterSpacing: 2,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w400),
                                      hintText: "Name",
                                      border: InputBorder.none,
                                    ),
                                    controller: _name,
                                  ),
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width / 2.2,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(140, 0, 0, 0),
                                    borderRadius:
                                        BorderRadius.circular(_yuvarlanma)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    validator: (alinansurname) {
                                      if (alinansurname!.length < 3) {
                                        return "Can't be shorter than three letters";
                                      } else {
                                        return null;
                                      }
                                    },
                                    cursorColor: Colors.green,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey,
                                          letterSpacing: 2,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w400),
                                      hintText: "Surname",
                                      border: InputBorder.none,
                                    ),
                                    controller: _surname,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(140, 0, 0, 0),
                                borderRadius:
                                    BorderRadius.circular(_yuvarlanma)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  validator: (alinanmail) {
                                    return alinanmail!.contains("@")
                                        ? null
                                        : "Invalid Mail";
                                  },
                                  cursorColor: Colors.green,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey,
                                        letterSpacing: 2,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w400),
                                    hintText: "E-mail",
                                    border: InputBorder.none,
                                  ),
                                  controller: email),
                            )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(140, 0, 0, 0),
                                borderRadius:
                                    BorderRadius.circular(_yuvarlanma)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                validator: (alinansifre) {
                                  // return alinansifre?.length.toInt() <= 6 ? null : "Enter at least six characters";
                                  if (alinansifre!.length < 6) {
                                    return "En az altı karakter gir";
                                  } else {
                                    return null;
                                  }
                                },
                                obscureText: true,
                                cursorColor: Colors.green,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 17,
                                      color: Colors.grey,
                                      letterSpacing: 2,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w400),
                                  hintText: "Password",
                                  border: InputBorder.none,
                                ),
                                controller: pass,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Are you a business?"),
                      Switch(
                          value: _isletme_mi,
                          onChanged: (val) {
                            setState(() {
                              _isletme_mi = val;
                            });
                          }),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 100),
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(_yuvarlanma),
                          ),
                          child: GestureDetector(
                            onTap: _emailSifreKullanicisi,
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GirisEkrani()));
                              },
                              child: Text(
                                "Already have an account?",
                                style: TextStyle(
                                    fontSize: 15,
                                    letterSpacing: 1.5,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w300),
                              ))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _emailSifreKullanicisi() async {
    try {
      String String_name = _name!.text.toString();
      String String_surname = _surname!.text.toString();
      String String_email = email!.text.toString();
      bool Isletme_Mi = _isletme_mi;

      UserCredential _credential = await auth.createUserWithEmailAndPassword(
          email: email!.text, password: pass!.text);
      User? yeniUser = _credential.user;

      yeniUser!.updateDisplayName(String_name + String_surname);

      yeniUser.sendEmailVerification();
      user = auth.currentUser;
      FirebasekayitEkle(
          String_name, String_surname, String_email, Isletme_Mi, yeniUser.uid);

      if (_isletme_mi == true) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) =>
                    IsletmeKayit(String_name, String_surname)),
            (route) => false);
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfilSayfasi()));
      }

      Fluttertoast.showToast(
          msg: "Verify your email",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green);

      HapticFeedback.lightImpact();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
