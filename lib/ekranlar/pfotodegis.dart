import 'dart:io';
import 'dart:async';
import 'package:ekinoks_elektron/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'kayit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

    firebase_storage.UploadTask yuklemeGorevi =
        referansYol.putFile(yuklenecekDosya);
    yuklemeGorevi.then((s) {
      if (s.state.toString() == firebase_storage.TaskState.success.toString()) {
        downloadURL = referansYol.getDownloadURL().toString();
        print(referansYol.getDownloadURL().toString());
        print(referansYol.getDownloadURL().toString());
        print(referansYol.getDownloadURL().toString());
        print(referansYol.getDownloadURL().toString());
        print(referansYol.getDownloadURL().toString());
      }
    });

    //= await firebase_storage.FirebaseStorage.instance
    //  .ref('Profilresimleri/${user!.uid}/profilresmi.png')
    //.getDownloadURL();
    await firestore
        .collection("Users")
        .doc(user!.uid)
        .set({"profilfotolink": downloadURL}, SetOptions(merge: true));
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
