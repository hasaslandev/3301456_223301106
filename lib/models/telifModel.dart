class TeklifModel {
  final String? teklifId;
  final String? adSoyad;
  final String? hastane;
  final String? iletisim;
  final String? sehir;
  final String? hastalik;
  final int? fiyat;
  final bool? isErkek;
  final String? resim;
  final String? tarih;
  final String? aciklama;
  TeklifModel(
      {
        this.teklifId,this.adSoyad,this.hastane,this.iletisim,this.sehir,this.hastalik,
        this.fiyat,this.isErkek,this.resim,this.tarih,this.aciklama
      });

  Map<String, dynamic> toMap() {
    return {
      'teklifId': teklifId,
      'adSoyad': adSoyad,
      'hastane': hastane,
      'iletisim': iletisim,
      'sehir': sehir,
      'hastalik': hastalik,
      'fiyat': fiyat,
      'isErkek': isErkek,
      'resim': resim,
      'tarih': tarih,
      'aciklama': aciklama,
    };
  }

  TeklifModel.fromFirestore(Map<String, dynamic> firestore)
      : teklifId = firestore['teklifId'],
        adSoyad = firestore['adSoyad'],
        hastane = firestore['hastane'],
        iletisim = firestore['iletisim'],
        sehir = firestore['sehir'],
        hastalik = firestore['hastalik'],
        fiyat = firestore['fiyat'],
        isErkek = firestore['isErkek'],
        resim = firestore['resim'],
        tarih = firestore['tarih'],
        aciklama = firestore['aciklama'];
}
