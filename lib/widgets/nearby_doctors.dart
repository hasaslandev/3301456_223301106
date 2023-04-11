import 'package:flutter/material.dart';
import 'package:randevu/models/doctor_model.dart';
import 'package:randevu/pages/doctorpage.dart';


class NearbyDoctors extends StatelessWidget {
  const NearbyDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    yakinDoktorlar.sort((a, b) => b.toplamGoruntulenme.compareTo(a.toplamGoruntulenme));
    //Görüntülenme sayısına göre sıraladım...
    return Column(
      children: List.generate(yakinDoktorlar.length, (index) {
        int yildizSayisi = 5;

        int puan = yakinDoktorlar[index].yildiz.toInt();
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
                MaterialPageRoute(builder: (context) =>  DoktorDetay(),
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
                      color: Colors.indigo, //deneme
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ), image: DecorationImage(
                          image: AssetImage(yakinDoktorlar[index].resim),
                          fit: BoxFit.cover) //Boxın içine doldurduk
                      ,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        yakinDoktorlar[index].isim,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(yakinDoktorlar[index].pozisyon),
                      const SizedBox(height: 20),
                      Row(
                        children:yildizlar,
                      ),
                      Row(
                        children: [
                          Text(
                              "${yakinDoktorlar[index].toplamGoruntulenme.toString()} Görüntülenme")
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
