import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EkinoksElektron extends StatefulWidget {
  const EkinoksElektron({Key? key}) : super(key: key);

  @override
  _EkinoksElektronState createState() => _EkinoksElektronState();
}

class _EkinoksElektronState extends State<EkinoksElektron> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ekinoks Takımı"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                subtitle: Text("Rami Atatürk Anadolu Lisesi"),
                title: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TyperAnimatedText("Serhan Ergül",
                        speed: Duration(milliseconds: 50)),
                    FlickerAnimatedText("Frontend & Backend"),
                  ],
                ),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://i.ibb.co/jHfrJgY/Whats-App-Image-2021-09-18-at-00-20-54.jpg"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                subtitle: Text("Beşiktaş Kız Anadolu İHL"),
                title: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText("Rabia Güneyli",
                        speed: Duration(milliseconds: 50)),
                    FlickerAnimatedText("Frontend")
                  ],
                ),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://i.ibb.co/gdFtnBf/Whats-App-Image-2021-09-18-at-00-14-12.jpg"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                subtitle: Text("Mustafa Saffet Fen lisesi"),
                title: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText("Cemil Fatih Yol",
                        speed: Duration(milliseconds: 50)),
                    FlickerAnimatedText("Takım Kaptanı")
                  ],
                ),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://i.ibb.co/V93Zjcm/Whats-App-Image-2021-09-18-at-00-34-08.jpg"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                subtitle: Text("Bahçelievler Anadolu Lisesi"),
                title: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText("Cemre Elibol",
                        speed: Duration(milliseconds: 30)),
                    TypewriterAnimatedText("Güvenlik Uzmanı",
                        speed: Duration(milliseconds: 30)),
                  ],
                ),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://instagram.fist6-1.fna.fbcdn.net/v/t51.2885-19/s150x150/209094869_844003959539801_6705593279682549147_n.jpg?_nc_ht=instagram.fist6-1.fna.fbcdn.net&_nc_ohc=3-nOrGY3E7EAX8IF3wA&edm=ABfd0MgBAAAA&ccb=7-4&oh=8e63decd0bb2bdbe06d37d8caf2e0e34&oe=614D2E3B&_nc_sid=7bff83"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                subtitle: Text("İTÜ İnşaat"),
                title: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText("Eren Bayrak",
                        speed: Duration(milliseconds: 50)),
                    TypewriterAnimatedText("İletişim Koordiantörü",
                        speed: Duration(milliseconds: 50)),
                  ],
                ),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://instagram.fist6-1.fna.fbcdn.net/v/t51.2885-19/s150x150/209105885_973014540196939_2205073520530959516_n.jpg?_nc_ht=instagram.fist6-1.fna.fbcdn.net&_nc_ohc=TJXgGuGrlBEAX__aD_B&edm=ABfd0MgBAAAA&ccb=7-4&oh=757929eead957e5e39bbffda5d106c06&oe=614B00EF&_nc_sid=7bff83"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                subtitle: Text("İTÜ de Makina Mühendisliği"),
                title: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText("Atıf Huzeyfe Çalışkan",
                        speed: Duration(milliseconds: 50)),
                    TypewriterAnimatedText("Takım Mentörü",
                        speed: Duration(milliseconds: 50)),
                  ],
                ),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://i.ibb.co/W6NFxzF/Whats-App-Image-2021-09-18-at-14-03-39.jpg"),
                ),
              ),
            ),
            Divider(),
            ElevatedButton(
                onPressed: _launchURL,
                child: Text("Ekinok-Elektron Uygulaması Kodları"))
          ],
        ),
      ),
    );
  }

  String _url = "https://github.com/serhan2004/Elektron-2";
  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
