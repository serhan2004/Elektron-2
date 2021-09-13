import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'kayit.dart';

class ProfilFotosuDegismeSayfasi extends StatefulWidget {
  const ProfilFotosuDegismeSayfasi({Key? key}) : super(key: key);

  @override
  _ProfilFotosuDegismeSayfasiState createState() =>
      _ProfilFotosuDegismeSayfasiState();
}

class _ProfilFotosuDegismeSayfasiState
    extends State<ProfilFotosuDegismeSayfasi> {
  final _picker = ImagePicker();
  File? _imagefile;
  Future PickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      if (pickedFile == null) return;
      _imagefile = File(pickedFile.path);
    });
  }

  Future uploadImageToFirebase(BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Upload or Change Your Profile Picture",
          style: TextStyle(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: PickImage,
                child: Text("Select a Picture"),
                style: ElevatedButton.styleFrom(primary: Colors.indigo),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Upload Picture"),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
