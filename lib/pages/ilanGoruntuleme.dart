import 'package:flutter/material.dart';
import 'package:randevu/models/isler_model.dart';

class ilanGotuntulenme extends StatefulWidget {
  const ilanGotuntulenme({Key? key}) : super(key: key);

  @override
  _JobListingScreenState createState() => _JobListingScreenState();
}

class _JobListingScreenState extends State<ilanGotuntulenme> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasta Listesi'),
      ),
      body: ListView.builder(
        itemCount: isler.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            IsDetayEkrani(isV: isler[index])));
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
                          isler[index].resim,
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
                              isler[index].baslik,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              isler[index].hastane,
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              isler[index].konum,
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
                              style:
                                  TextStyle(fontSize: 12.0, color: Colors.grey),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              isler[index].tarih,
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
      ),
    );
  }
}

class IsDetayEkrani extends StatelessWidget {
  final Is isV;

  const IsDetayEkrani({required this.isV});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İş Detayları'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              isV.resim,
              height: 120.0,
            ),
            SizedBox(height: 20.0),
            Text(
              isV.baslik,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.black87),
            ),
            SizedBox(height: 10.0),
            Text(
              isV.hastane,
              style: const TextStyle(fontSize: 18.0, color: Colors.grey),
            ),
            SizedBox(height: 10.0),
            Text(
              isV.konum,
              style: const TextStyle(fontSize: 18.0, color: Colors.grey),
            ),
            SizedBox(height: 20.0),
            const Text(
              'İlan Detayları:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black87),
            ),
            const SizedBox(height: 10.0),
             Text(isV.hastalikDetay,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

