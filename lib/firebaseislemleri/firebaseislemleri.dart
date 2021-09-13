import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekinoks_elektron/main.dart';
import 'package:flutter/material.dart';


void FirebasekayitEkle(
    var isim, var soyisim, var emaill, bool isletmemi, var uid) {
  Map<String, dynamic> kisiekle = Map();
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
  firestore.collection("Users").doc(uid).set({
    "Kartlar": Kartlar,
  }, SetOptions(merge: true));
}
