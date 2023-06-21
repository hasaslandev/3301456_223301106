import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class vucutKitle extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> _getDoktorListesi() async {
    QuerySnapshot snapshot = await _firestore.collection('doktorModel').get();
    List<Map<String, dynamic>> doktorlar = snapshot.docs.map((doc) {
      Map<String, dynamic> doktor = doc.data() as Map<String, dynamic>;
      return {
        'isim': doktor['isim'],
        'telefon': doktor['telefon'],
        'pozisyon': doktor['pozisyon'],
      };
    }).toList();
    return doktorlar;
  }

  Future<void> _generatePDF(BuildContext context) async {
    final pdf = pw.Document();

    final doktorlar = await _getDoktorListesi();

    pdf.addPage(
      pw.MultiPage(
        build: (pw.Context context) {
          return [
            pw.Table.fromTextArray(
              headers: ['isim', 'telefon', 'pozisyon'],
              data: doktorlar.map((doktor) {
                return [doktor['isim'], doktor['telefon'], doktor['pozisyon']];
              }).toList(),
              border: pw.TableBorder.all(),
              cellAlignment: pw.Alignment.center,
            ),
          ];
        },
      ),
    );

    final appDocDir = await getApplicationDocumentsDirectory();
    final filePath = '${appDocDir.path}/doktor_listesi.pdf';
    final File file = File(filePath);
    await file.writeAsBytes(await pdf.save());

    // Dosya yolunu konsola yazdır
    print('Dosya Yolu: $filePath');

    // İndirme işlemi tamamlandığında kullanıcıya bir geri bildirim verin
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('PDF İndirme Tamamlandı'),
          content: Text('PDF dosyası oluşturuldu: $filePath'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tamam'),
            ),
          ],
        );
      },
    );

    // Dosyayı açmak için
    final result = await OpenFilex.open(filePath);

    if (result.type == ResultType.error) {
      // Hata durumunda kullanıcıya bir geri bildirim verebilirsiniz
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Dosya Açma Hatası'),
            content: Text('Dosya açılamadı: $filePath'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Tamam'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebaseden pdfe '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _generatePDF(context);
              },
              child: Text('PDF Oluştur ve indir'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Dosyayı açmak için
                OpenFilex.open("filePath");
              },
              child: Text('PDF Dosyasını Aç'),
            ),
          ],
        ),
      ),
    );
  }
}
