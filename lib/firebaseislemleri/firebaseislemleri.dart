import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekinoks_elektron/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

void FirebasekayitEkle(
    var isim, var soyisim, var emaill, bool isletmemi, var uid) {
  Map<String, dynamic> kisiekle = Map();
  kisiekle["profilfotolink"] = "https://i.ibb.co/B3BbBhP/indir.jpg";

  kisiekle["isim"] = isim;
  kisiekle["soy_isim"] = soyisim;
  kisiekle["email"] = emaill;
  kisiekle["Isletme_Mi"] = isletmemi;
  kisiekle["Bakiye"] = 0;
  if (isletmemi == false) firestore.collection("Users").doc(uid).set(kisiekle);
  if (isletmemi == true) firestore.collection("Stores").doc(uid).set(kisiekle);
}

void FbMagazaKayitEkle(
    var uid, var MagazaAdi, var MAdres, var TC, var Miletisim, var Mhakkinda) {
  Map<String, dynamic> magazaKayitdetay = Map();
  magazaKayitdetay["Magaza_Adi"] = MagazaAdi;
  magazaKayitdetay["Magaza_Adres"] = MAdres;
  magazaKayitdetay["Magaza_Sahibi_tc"] = TC;
  magazaKayitdetay["Magaza_Iletisim"] = Miletisim;
  magazaKayitdetay["Magaza_Hakkinda"] = Mhakkinda;

  firestore
      .collection("Stores")
      .doc(uid)
      .set({"Magazabilgi": magazaKayitdetay}, SetOptions(merge: true));
}

void FbKullaniciKartEkle(
    var uid,
    TextEditingController kart_ismi,
    TextEditingController cardHolderName,
    TextEditingController cardNumbers,
    TextEditingController cardCVV,
    TextEditingController cardExpiry) {
  String _kartcvv = cardCVV.text.toString();
  String _kartnumaralari = cardNumbers.text.toString();
  String _kartsahibi = cardHolderName.text.toString();
  String _skt = cardExpiry.text.toString();
  String _kart_isim = kart_ismi.text.toString();

  Map<String, dynamic> Kartlar = Map();

  Kartlar["Kart_ismi"] = _kart_isim;
  Kartlar["Kart_sahibi"] = _kartsahibi;
  Kartlar["Kart_numaralari"] = _kartnumaralari;
  Kartlar["Kart_cvv"] = _kartcvv;
  Kartlar["Kart_skt"] = _skt;
  firestore.collection("CreditCards").doc(uid).set({
    "Kartlar": Kartlar,
  }, SetOptions(merge: true));
}

void FbStoreUrunekle(
  var uid,
  TextEditingController urunIsim,
  TextEditingController urunKategori,
  TextEditingController stt,
  TextEditingController stok,
  TextEditingController fiyat,
) {
  String urunIsim_String = urunIsim.text.toString().toUpperCase();
  String urunKategori_String = urunKategori.text.toString().toUpperCase();
  String stt_String = stt.text.toString().toUpperCase();
  int stok_int = int.parse(stok.text);
  int fiyat_int = int.parse(fiyat.text);
  Map Urundetay = {
    "Urunismi": urunIsim_String,
    "UrunKategori": urunKategori_String,
    "SonTuketimTarihi": stt_String,
    "Stok": stok_int,
    "Fiyat": fiyat_int,
  };
  Map urun = {urunIsim_String: Urundetay};

  firestore
      .collection("Products")
      .doc(uid)
      .set({"Urunler": urun}, SetOptions(merge: true));
}

void FbOdemeTamamlama(var uid, double tutar, String magazaid) {
  final DocumentReference Turistref =
      FirebaseFirestore.instance.collection("Users").doc(uid);
  final DocumentReference MagazaRef =
      FirebaseFirestore.instance.collection("Stores").doc(magazaid);
  FirebaseFirestore.instance.runTransaction((transaction) async {
    DocumentSnapshot TuristData = await Turistref.get();
    DocumentSnapshot MagazaData = await MagazaRef.get();

    var TuristBakiye = TuristData['Bakiye'];
    var MagazaBakiye = MagazaData['Bakiye'];

    if (TuristData.exists) {
      if (TuristData['Bakiye'] >= tutar) {
        transaction.update(Turistref, {"Bakiye": TuristBakiye - tutar});
        transaction.update(MagazaRef, {"Bakiye": TuristBakiye + tutar});
      } else {}
    } else {
      print("Bu kullan??c?? Yok");
    }
  });
}
