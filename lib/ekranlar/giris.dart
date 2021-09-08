import 'package:ekinoks_elektron/ekranlar/kayit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

String img = "assets/images/arkaplan.jpg";

class GirisEkrani extends StatefulWidget {
  @override
  _GirisEkraniState createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  TextEditingController? _email;
  TextEditingController? _pass;
  @override
  void initState() {
    email = TextEditingController();
    pass = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email?.dispose();
    pass?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _yuvarlanma = 30;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print(email!.text);
          },
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(img),
              Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  AnimatedDefaultTextStyle(
                      child: AnimatedTextKit(animatedTexts: [
                        WavyAnimatedText("Login Up"),
                        WavyAnimatedText("Now")
                      ]),
                      style: TextStyle(fontSize: 18),
                      duration: const Duration(milliseconds: 300)),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 130),
                    child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(140, 0, 0, 0),
                            borderRadius: BorderRadius.circular(_yuvarlanma)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            obscureText: false,
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
                            controller: _email,
                          ),
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
                            borderRadius: BorderRadius.circular(_yuvarlanma)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: _pass,
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
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 100),
                    child: GestureDetector(
                      onTap: () {
                        girisYap();
                        HapticFeedback.lightImpact();
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(_yuvarlanma),
                        ),
                        child: Center(
                          child: Text(
                            "Login Up",
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
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Register Page?",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic),
                          ))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void girisYap() async {
    String _emailgir = _email!.text.toString();
    String _passgir = _pass!.text.toString();

    try {
      if (user == null) {
        oturumAcanUser = await auth.signInWithEmailAndPassword(
            email: _emailgir, password: _passgir);
      }
      print(user!.displayName.toString());
      print(oturumAcanUser!.user!.displayName);
    } catch (e) {
      print(e);
    }
  }
}

UserCredential? oturumAcanUser;
