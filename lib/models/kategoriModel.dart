class KategoriModel {
  final String? KategoriId;
  final String? KategoriAdi;
  KategoriModel(
      {
        this.KategoriId,this.KategoriAdi
      });

  Map<String, dynamic> toMap() {
    return {
      'KategoriId': KategoriId,
      'KategoriAdi': KategoriAdi,
    };
  }

  KategoriModel.fromFirestore(Map<String, dynamic> firestore)
      : KategoriId = firestore['KategoriId'],
        KategoriAdi = firestore['KategoriAdi'];
}
