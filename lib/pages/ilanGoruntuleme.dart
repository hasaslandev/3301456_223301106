import 'package:flutter/material.dart';
import 'package:randevu/models/telifModel.dart';
import 'package:randevu/services/teklifmodel/firestore_teklifmodel_servis.dart';
import 'package:url_launcher/url_launcher.dart';

class IlanListesi extends StatefulWidget {
  const IlanListesi({Key? key}) : super(key: key);

  @override
  _IlanListesiState createState() => _IlanListesiState();
}

class _IlanListesiState extends State<IlanListesi> {
  final FirestoreTeklifmodelService _teklifModelService =
  FirestoreTeklifmodelService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasta İşlemleri'),
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
                  child: Dismissible(
                    key: UniqueKey(),
                    background: Container(
                      color: Colors.red,
                      child: Icon(Icons.delete),
                    ),
                    secondaryBackground: Container(
                      color: Colors.blue,
                      child: Icon(Icons.edit),
                    ),
                    confirmDismiss: (direction) async {
                      if (direction == DismissDirection.endToStart) {
                        // Sağa kaydırma işlemi burada işlenecek (örneğin: Silme işlemi)
                        return true; // İşlemin onaylanmasını sağlamak için true döndürün
                      } else if (direction == DismissDirection.startToEnd) {
                        // Sola kaydırma işlemi burada işlenecek (örneğin: Düzenleme işlemi)
                        return true; // İşlemin onaylanmasını sağlamak için true döndürün
                      }
                      return false; // Diğer yönlere kaydırma işlemini engellemek için false döndürün
                    },
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        // Sağa kaydırma işlemi burada işlenecek (örneğin: Silme işlemi)
                      } else if (direction == DismissDirection.startToEnd) {
                        // Sola kaydırma işlemi burada işlenecek (örneğin: Düzenleme işlemi)
                      }
                    },
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TeklifDetayEkrani(teklif: teklif),
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
                                  teklif.resim ?? '',
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
                                      teklif.hastalik ?? '',
                                      style: TextStyle(
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
                                      teklif.sehir ?? '',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                    SizedBox(height: 5.0),
                                    Row(
                                      children: [
                                        Icon(Icons.monetization_on,
                                            color: Colors.grey, size: 18.0),
                                        SizedBox(width: 5.0),
                                        Text(
                                          'Fiyat: ${teklif.fiyat.toString()}',
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.calendar_today,
                                        color: Colors.grey, size: 18.0),
                                    SizedBox(height: 5.0),
                                    Text(
                                      'Tarih',
                                      style: TextStyle(
                                          fontSize: 12.0, color: Colors.grey),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      teklif.tarih ?? 'Girilmemiş',
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Veriler alınırken hata oluştu.'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}




class TeklifDetayEkrani extends StatefulWidget {
  final TeklifModel teklif;

  const TeklifDetayEkrani({required this.teklif});

  @override
  _TeklifDetayEkraniState createState() => _TeklifDetayEkraniState();
}

class _TeklifDetayEkraniState extends State<TeklifDetayEkrani> {
  TextEditingController fiyatController = TextEditingController();

  void fiyatBilgisiAl() {
    String fiyat = fiyatController.text;
    // Fiyat bilgisini kullanmak için yapılacak işlemleri buraya ekleyebilirsiniz
  }

  void teklifSun() {
    // Teklif sunmak için yapılacak işlemleri buraya ekleyebilirsiniz
  }

  @override
  void dispose() {
    fiyatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teklif Detayları'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    widget.teklif.resim ?? '',
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Icon(Icons.medical_services, size: 24.0, color: Colors.black54),
                  SizedBox(width: 10.0),
                  Text(
                    'Hastalık:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Text(
                widget.teklif.hastalik ?? '',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Icon(Icons.local_hospital, size: 24.0, color: Colors.black54),
                  SizedBox(width: 10.0),
                  Text(
                    'Hastane:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Text(
                widget.teklif.hastane ?? '',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10.0),
              const Row(
                children: [
                  Icon(Icons.location_city, size: 24.0, color: Colors.black54),
                  SizedBox(width: 10.0),
                  Text(
                    'Şehir:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Text(
                widget.teklif.sehir ?? '',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Icon(Icons.attach_money, size: 24.0, color: Colors.black54),
                  SizedBox(width: 10.0),
                  Text(
                    'Fiyat:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Text(
                '${widget.teklif.fiyat.toString()} TL',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Icon(Icons.description, size: 24.0, color: Colors.black54),
                  SizedBox(width: 10.0),
                  Text(
                    'Teklif Detayları:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  widget.teklif.aciklama ?? '',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Icon(Icons.phone, size: 24.0, color: Colors.black54),
                  SizedBox(width: 10.0),
                  Text(
                    'Telefon Numarası:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                    ),
                ],
              ),
              Text(
                widget.teklif.iletisim ?? '',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Fiyat Bilgisi:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: fiyatController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Fiyat girin',
                  border: OutlineInputBorder(),
                ),
              ),


              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  teklifSun();
                },
                child: Text('Teklif Sun'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

