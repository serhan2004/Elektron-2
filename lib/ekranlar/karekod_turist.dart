import 'package:ekinoks_elektron/ekranlar/odeme_sayfasi.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';

List<String>? result;
List<String> parantezsiz_result = [];

class TuristKarekod extends StatefulWidget {
  const TuristKarekod({Key? key}) : super(key: key);

  @override
  _TuristKarekodState createState() => _TuristKarekodState();
}

class _TuristKarekodState extends State<TuristKarekod> {
  Result? currentResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (currentResult.toString() != "null") {
              //Fluttertoast.showToast(msg: currentResult.toString());
              result = currentResult.toString().split(",");
              parantezsiz_result
                  .add(result![0].substring(1, result![0].length).toString());
              parantezsiz_result
                  .add(result!.last.substring(0, result!.last.length - 1));

              for (int i = 1; i < result!.length - 1; i++) {
                parantezsiz_result.add(result![i]);
              }
              Fluttertoast.showToast(msg: parantezsiz_result.toString());
              currentResult = null;
              result = null;
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => OdemeSayfasi()));
            } else {
              Fluttertoast.showToast(
                  msg: "Qrcode could not be read", backgroundColor: Colors.red);
            }
          },
          label: Text("Scann")),
      appBar: AppBar(
        title: Text("Scann Your Shopping Cart"),
      ),
      body: Center(
        child: QRCodeDartScanView(
          scanQRCodeInverted: true,
          onCapture: (Result result) {
            setState(() {
              if (result.toString() != "null") {
                currentResult = result;
              }
            });
          },
        ),
      ),
    );
  }
}
