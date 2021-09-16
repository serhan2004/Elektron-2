import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vibration/vibration.dart';
import 'kayit.dart';

class KarekodSayfasi extends StatefulWidget {
  const KarekodSayfasi({Key? key}) : super(key: key);

  @override
  _KarekodSayfasiState createState() => _KarekodSayfasiState();
}

class _KarekodSayfasiState extends State<KarekodSayfasi> {
  Result? currentResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Stack(alignment: Alignment.bottomCenter, children: [
            QRCodeDartScanView(
              scanQRCodeInverted: true,
              onCapture: (Result result) {
                setState(() {
                  currentResult = result;
                });
              },
            ),
          ]),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton.extended(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    Store_okutulanUrunler.removeLast();
                    Vibration.vibrate(duration: 250);
                    setState(() {
                      Fluttertoast.showToast(
                          msg: currentResult.toString(),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 8.0);
                    });
                  },
                  label: Text("Delete Last Product"),
                  icon: Icon(Icons.delete_forever_outlined),
                ),
                FloatingActionButton.extended(
                  heroTag: 1,
                  backgroundColor: Colors.green,
                  onPressed: () {
                    Store_okutulanUrunler.add(currentResult.toString());
                    Vibration.vibrate(duration: 250);
                    setState(() {
                      Fluttertoast.showToast(
                          msg: currentResult.toString(),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 8.0);
                    });
                  },
                  label: Text("Scann&Aadd Product"),
                  icon: Icon(Icons.add),
                ),
                FloatingActionButton(
                    child: Icon(
                      Icons.verified_user_sharp,
                      color: Colors.orange,
                    ),
                    backgroundColor: Colors.indigo,
                    heroTag: 2,
                    onPressed: () {
                      Vibration.vibrate(duration: 250);
                      Store_okutulanUrunler.forEach(
                          (element) => print(element.toString()));
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  void Store_ListeyeEkle(var okunanKarekod) {
    Store_okutulanUrunler.add(okunanKarekod.toString());
  }
}

List<dynamic> Store_okutulanUrunler = [user!.uid];
