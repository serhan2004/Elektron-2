import 'package:flutter/material.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: () {
          setState(() {
            Fluttertoast.showToast(
                msg: currentResult.toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0);
          });
        },
        label: Text("Ürün Okut"),
        icon: Icon(Icons.add),
      ),
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
        ],
      ),
    );
  }
}
