import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randevu/models/doktorModel.dart';
import 'package:randevu/pages/doktorDetay.dart';

class DoktorGoruntuleme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final doktorlar = context.watch<List<DoktorModel>>();

    if (doktorlar == null) {
      // Veriler henüz yüklenmediyse, yüklenme görselini veya mesajını gösterin
      return CircularProgressIndicator();
    }

    doktorlar.sort((a, b) => (b.toplamGoruntulenme ?? 0).compareTo(a.toplamGoruntulenme ?? 0));

    return Column(
      children: List.generate(doktorlar.length, (index) {
        int yildizSayisi = 5;

        int puan = doktorlar[index].yildiz ?? 0;
        List<Icon> yildizlar = [];
        for (int i = 0; i < yildizSayisi; i++) {
          if (i < puan) {
            yildizlar.add(
              Icon(
                Icons.star,
                size: 18,
                color: Colors.yellow[700],
              ),
            );
          } else {
            yildizlar.add(
              const Icon(
                Icons.star_border,
                size: 18,
                color: Colors.grey,
              ),
            );
          }
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoktorDetay(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.teal,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      image: DecorationImage(
                        image: AssetImage(doktorlar[index].resim ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doktorlar[index].isim ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(doktorlar[index].pozisyon ?? ''),
                      const SizedBox(height: 20),
                      Row(
                        children: yildizlar,
                      ),
                      Row(
                        children: [
                          Text("${doktorlar[index].toplamGoruntulenme.toString()} Görüntülenme"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

/*class DoktorGoruntuleme extends StatelessWidget {
  final String? isim;
  final String? pozisyon;
  final int? yildiz;
  final int? toplamGoruntulenme;
  final String? resim;
  final String? bKisaAciklama;
  final String? bUzunAciklama;

  DoktorGoruntuleme({
     this.yildiz,
     this.pozisyon,
     this.toplamGoruntulenme,
     this.isim,
     this.resim,
     this.bKisaAciklama,
     this.bUzunAciklama,
  });

  @override
  Widget build(BuildContext context) {
    final doktorlar = context.watch<List<DoktorModel>>();


    doktorlar.sort((a, b) => b.toplamGoruntulenme!.compareTo(a.toplamGoruntulenme as num));

    return Column(
      children: List.generate(doktorlar.length, (index) {
        int yildizSayisi = 5;

        int ?puan = doktorlar[index].yildiz?.toInt();
        List<Icon> yildizlar = [];
        for (int i = 0; i < yildizSayisi; i++) {
          if (i < puan!) {
            yildizlar.add(
              Icon(
                Icons.star,
                size: 18,
                color: Colors.yellow[700],
              ),
            );
          } else {
            yildizlar.add(
              const Icon(
                Icons.star_border,
                size: 18,
                color: Colors.grey,
              ),
            );
          }
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoktorDetay(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.teal,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      image: DecorationImage(
                        image: AssetImage(doktorlar[index].resim!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doktorlar[index].isim!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(doktorlar[index].pozisyon!),
                      const SizedBox(height: 20),
                      Row(
                        children: yildizlar,
                      ),
                      Row(
                        children: [
                          Text("${doktorlar[index].toplamGoruntulenme.toString()} Görüntülenme"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
*/
