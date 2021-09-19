import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:vibration/vibration.dart';
import 'kayit.dart';
import 'package:get/get.dart';

class KarekodSayfasi extends StatefulWidget {
  const KarekodSayfasi({Key? key}) : super(key: key);

  @override
  _KarekodSayfasiState createState() => _KarekodSayfasiState();
}

class _KarekodSayfasiState extends State<KarekodSayfasi> {
  Result? currentResult;
  @override
  void initState() {
    Store_okutulanUrunler.clear();
    Store_okutulanUrunler.add(user!.uid);

    super.initState();
  }

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
            Center(
              child: Text(
                "Scanned Value : $currentResult",
                style: TextStyle(
                    color: Colors.white, backgroundColor: Colors.black),
              ),
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
                    setState(() {
                      if (Store_okutulanUrunler.length > 1) {
                        Store_okutulanUrunler.removeLast();
                      }
                    });
                    Vibration.vibrate(duration: 250);
                    setState(() {
                      Fluttertoast.showToast(
                          msg: Store_okutulanUrunler.toString(),
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
                    setState(() {
                      if (currentResult.toString() != "null") {
                        Store_okutulanUrunler.add(currentResult.toString());
                      }
                    });
                    Vibration.vibrate(duration: 250);
                    setState(() {
                      Fluttertoast.showToast(
                          msg: Store_okutulanUrunler.toString(),
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
                    backgroundColor:
                        Color.fromARGB(255, 18, 42, 82), //Colors.indigo,
                    heroTag: 2,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (c) => ListToQrcode()));
                      Vibration.vibrate(duration: 250);
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

class ListToQrcode extends StatefulWidget {
  const ListToQrcode({Key? key}) : super(key: key);

  @override
  _ListToQrcodeState createState() => _ListToQrcodeState();
}

class _ListToQrcodeState extends State<ListToQrcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read Qrcode"),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: SfBarcodeGenerator(
            value: Store_okutulanUrunler.toString(),
            symbology: QRCode(),
            showValue: true,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.exit_to_app_sharp),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
