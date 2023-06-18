import 'package:flutter/material.dart';
import 'package:randevu/models/telifModel.dart';
import 'package:randevu/services/teklifmodel/firestore_teklifmodel_servis.dart';

class IlanListesi extends StatefulWidget {
  const IlanListesi({Key? key}) : super(key: key);

  @override
  _IlanListesiState createState() => _IlanListesiState();
}

class _IlanListesiState extends State<IlanListesi> {
  final FirestoreTeklifmodelService _teklifModelService = FirestoreTeklifmodelService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İlan Listesi'),
      ),
      body: StreamBuilder<List<TeklifModel>>(
        stream: _teklifModelService.getTeklifModel(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final teklifler = snapshot.data!;
            return ListView.builder(
              itemCount: teklifler.length,
              itemBuilder: (BuildContext context, int index) {
                final teklif = teklifler[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TeklifDetayEkrani(teklif: teklif),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                "teklif.resim",
                                height: 80.0,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "teklif.baslik",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    teklif.hastane ?? '',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    teklif.sehir ??'',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.calendar_month, color: Colors.grey),
                                  const SizedBox(height: 5.0),
                                  const Text(
                                    'Tarih',
                                    style: TextStyle(fontSize: 12.0, color: Colors.grey),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "12.02.2023",
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Veriler alınırken hata oluştu.'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class TeklifDetayEkrani extends StatelessWidget {
  final TeklifModel teklif;

  const TeklifDetayEkrani({required this.teklif});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teklif Detayları'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "teklif.resim",
              height: 120.0,
            ),
            SizedBox(height: 20.0),
            Text(
              "teklif.baslik",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              teklif.hastane ?? '',
              style: const TextStyle(fontSize: 18.0, color: Colors.grey),
            ),
            SizedBox(height: 10.0),
            Text(
              teklif.sehir ?? '',
              style: const TextStyle(fontSize: 18.0, color: Colors.grey),
            ),
            SizedBox(height: 20.0),
            const Text(
              'Teklif Detayları:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              "teklif.detay",
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
