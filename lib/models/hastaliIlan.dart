class HastalikIlan {
  final String? HastaId;
  final String? HastaAS;
  final String? Hastane;
  final int? Iletisim;
  final int? Sehir;
  final String? Fiyat;
  final String? Cinsiyet;
  final String? Aciklama;

  HastalikIlan(
      {
        this.HastaId,this.HastaAS, this.Hastane, this.Iletisim,
        this.Sehir, this.Fiyat,this.Cinsiyet,this.Aciklama
      });

  Map<String, dynamic> toMap() {
    return {
      'HastaId': HastaId,
      'HastaAS': HastaAS,
      'Hastane': Hastane,
      'Iletisim': Iletisim,
      'Sehir': Sehir,
      'Fiyat': Fiyat,
      'Cinsiyet': Cinsiyet,
      'Aciklama': Aciklama,
    };
  }

  HastalikIlan.fromFirestore(Map<String, dynamic> firestore)
      : HastaId = firestore['HastaId'],
        HastaAS =firestore['HastaAS'],
        Hastane = firestore['Hastane'],
        Iletisim = firestore['Iletisim'],
        Sehir = firestore['Sehir'],
        Fiyat = firestore['Fiyat'],
        Cinsiyet = firestore['Cinsiyet'],
        Aciklama = firestore['Aciklama'];
}
