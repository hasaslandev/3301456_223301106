class DoktorModel {
  final String isim;
  final String pozisyon;
  final int yildiz;
  final int toplamGoruntulenme;
  final String resim;
  final String? bKisaAciklama;
  final String? bUzunAciklama;
  DoktorModel({
    required this.isim,
    required this.pozisyon,
    required this.yildiz,
    required this.toplamGoruntulenme,
    required this.resim,
    this.bKisaAciklama="Şuanda hizmet yok...",
    this.bUzunAciklama="Şuanlık Bir açıklama yok...",
  });
}

final List<DoktorModel> yakinDoktorlar = [
  DoktorModel(
    isim: "Prof.Dr. Şeyma",
    pozisyon: "Diyetisyen",
    yildiz: 4,
    toplamGoruntulenme: 40,
    resim: "assets/images/doctor_1.jpg",
  ),
  DoktorModel(
    isim: "Sophie Harmon",
    pozisyon: "Genel Pratisyen",
    yildiz: 2,
    toplamGoruntulenme: 30,
    resim: "assets/images/doctor_2.jpg",
  ),
  DoktorModel(
    isim: "Louise Reid",
    pozisyon: "Genel Pratisyen",
    yildiz: 5,
    toplamGoruntulenme: 20,
    resim: "assets/images/doctor_3.jpg",
  ),
  DoktorModel(
    isim: "Musa Koyun",
    pozisyon: "Diyetisyen",
    yildiz: 2,
    toplamGoruntulenme: 220,
    resim: "assets/images/doctor_4.jpg",
  ),
  DoktorModel(
    isim: "Hasan Aslan",
    pozisyon: "Ebe",
    yildiz: 3,
    toplamGoruntulenme: 1220,
    resim: "assets/images/doctor_5.jpg",
  ),
  DoktorModel(
    isim: "Kemal Dursun",
    pozisyon: "İç Hastalıkları Doktoru",
    yildiz: 5,
    toplamGoruntulenme: 1241991,
    resim: "assets/images/doctor_6.jpg",
  ),
];
