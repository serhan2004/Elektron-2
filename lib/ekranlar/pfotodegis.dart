import 'dart:io';
import 'dart:async';

import 'package:ekinoks_elektron/ekranlar/profil_sayfasi.dart';
import 'package:ekinoks_elektron/main.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:vibration/vibration.dart';
import 'kayit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekinoks_elektron/firebaseislemleri/getx/getxislemleri.dart';

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

  String downloadURL = "yok";
  uploadImageToFirebase() async {
    File yuklenecekDosya = _imagefile!;
    firebase_storage.Reference referansYol = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child("Profilresimleri")
        .child(user!.uid)
        .child("profilresmi.png");
    firebase_storage.UploadTask uploadTask =
        referansYol.putFile(yuklenecekDosya);
    var url = await (await uploadTask).ref.getDownloadURL();
    firestore
        .collection("Users")
        .doc(user!.uid)
        .set({"profilfotolink": url}, SetOptions(merge: true)).then((value) {
      profilfotosu.ppfotolink = url;
      Navigator.pop(context);
    });
  }

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
                onPressed: uploadImageToFirebase,
                child: Text(
                  "Upload Picture and exit app",
                  style: TextStyle(fontSize: 13),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
alert dialog fotoğraf seç fotoğraf değiştir.


*/