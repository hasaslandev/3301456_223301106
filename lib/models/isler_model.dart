class Is {
  final String resim;
  final String baslik;
  final String hastane;
  final String konum;
  final String tarih;
  final String hastalikDetay;

  const Is(
      {required this.resim,
        required this.baslik,
        required this.hastane,
        required this.konum,
        required this.tarih,
        required this.hastalikDetay,});
}
List<Is> isler = [
  const Is(
      resim: 'assets/images/doctor_1.jpg',
      baslik: 'Ebelik Hizmeti',
      hastane: 'Selçuk Üniversitesi',
      konum:  'Konya/Selçuklu',
      tarih:  '30 Nisan, 2023',
      hastalikDetay:  'Kalpte Delik'),
  const Is(
      resim: 'assets/images/doctor_2.jpg',
      baslik: 'Yaşlı Bakımı',
      hastane: 'Beykent Özel Hastanesi',
      konum: 'Ankara/Merkez',
      tarih:  '30 Nisan, 2023',
      hastalikDetay:  'Engelli'),
  const Is(
      resim: 'assets/images/doctor_3.jpg',
      baslik: 'Dişci',
      hastane: 'Zindankale Özel Hastanesi',
      konum: 'Konya/Seydişehir',
      tarih:  '30 Nisan, 2023',
      hastalikDetay:  'Sigara Bağımlısı'),
];
