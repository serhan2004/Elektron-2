class kartData {
  String? _Kartisim;
  String? _KartSahibi;
  int? _kartNumaralari;
  int? _cvv;
  String? _cardexpriy;

  kartData(this._KartSahibi, this._Kartisim, this._cardexpriy, this._cvv,
      this._kartNumaralari);

  kartData.fromJson(Map<String, dynamic> json) {
    _Kartisim = json["Kartisim"];
    _KartSahibi = json["KartSahibi"];
    _kartNumaralari = json["KartNumaralari"];
    _cvv = json["cvv"];
    _cardexpriy = json["cardexpriy"];
  }
}
