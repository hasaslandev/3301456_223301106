import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randevu/models/doktorModel.dart';
import 'package:randevu/pages/doktorDetay.dart';

class DoktorGoruntuleme extends StatelessWidget {
  final String category;

  DoktorGoruntuleme({required this.category});

  @override
  Widget build(BuildContext context) {
    final doktorlar = context.watch<List<DoktorModel>?>();

    if (doktorlar == null) {
      // Veriler henüz yüklenmediyse, yüklenme görselini veya mesajını gösterin
      return CircularProgressIndicator();
    }

    List<DoktorModel> filteredDoktorlar;
    if (category == "Tümü") {
      filteredDoktorlar = doktorlar;
    } else {
      filteredDoktorlar = doktorlar.where((doktor) => doktor.pozisyon == category).toList();
    }

    filteredDoktorlar.sort((a, b) => (b.toplamGoruntulenme ?? 0).compareTo(a.toplamGoruntulenme ?? 0));

    return Column(
      children: List.generate(filteredDoktorlar.length, (index) {
        int yildizSayisi = 5;

        int puan = filteredDoktorlar[index].yildiz ?? 0;
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
            onDoubleTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoktorDetay(doktor: filteredDoktorlar[index]),
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
                        image: AssetImage(filteredDoktorlar[index].resim ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        filteredDoktorlar[index].isim ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(filteredDoktorlar[index].pozisyon ?? ''),
                      const SizedBox(height: 20),
                      Row(
                        children: yildizlar,
                      ),
                      Row(
                        children: [
                          Text(
                            "${filteredDoktorlar[index].toplamGoruntulenme.toString()} Görüntülenme",
                          ),
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
