class DoktorModel {
  final String? doctorId;
  final String? isim;
  final String? pozisyon;
  final int? yildiz;
  final int? toplamGoruntulenme;
  final String? resim;
  final String? bKisaAciklama;
  final String? bUzunAciklama;
  final String? email;
  final String? sifre;

  DoktorModel(
      {
        this.doctorId,this.isim, this.pozisyon, this.yildiz,
        this.toplamGoruntulenme, this.resim,this.bKisaAciklama,this.bUzunAciklama,
        this.email,this.sifre
      });

  Map<String, dynamic> toMap() {
    return {
      'doctorId': doctorId,
      'isim': isim,
      'pozisyon': pozisyon,
      'yildiz': yildiz,
      'resim': resim,
      'toplamGoruntulenme': toplamGoruntulenme,
      'bKisaAciklama': bKisaAciklama,
      'bUzunAciklama': bUzunAciklama,
      'email': email,
      'sifre': sifre,
    };
  }

  DoktorModel.fromFirestore(Map<String, dynamic> firestore)
      : doctorId = firestore['doctorId'],
        isim = firestore['isim'],
        pozisyon = firestore['pozisyon'],
        yildiz = firestore['yildiz'],
        resim = firestore['resim'],
        toplamGoruntulenme = firestore['toplamGoruntulenme'],
        bKisaAciklama = firestore['bKisaAciklama'],
        bUzunAciklama = firestore['bUzunAciklama'],
        email = firestore['email'],
        sifre = firestore['sifre'];
}
