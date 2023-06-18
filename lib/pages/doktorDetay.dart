import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:randevu/models/doktorModel.dart';

class DoktorDetay extends StatelessWidget {
  final DoktorModel doktor;

  DoktorDetay({required this.doktor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            DoktorHakkinda(doktor: doktor),
            DetailBody(doktor: doktor),
          ],
        ),
      ),
    );
  }
}

class DoktorHakkinda extends StatelessWidget {
  final DoktorModel doktor;

  DoktorHakkinda({required this.doktor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 65.0,
            backgroundImage: AssetImage(doktor.resim??''),
            backgroundColor: Colors.white,
          ),
          Text(
            doktor.isim ?? '',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            child: Text(
              doktor.pozisyon ?? '',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            child: Text(
              doktor.bKisaAciklama ?? '',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            child: Text(
              doktor.bUzunAciklama ?? '',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  final DoktorModel doktor;

  DetailBody({required this.doktor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DoctorInfo(doktor: doktor),
          Text("Burası harita alanı olacaktır."),
        ],
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  final DoktorModel doktor;

  DoctorInfo({required this.doktor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InfoCard(label: 'Tedavi Edilen Hasta Sayısı', value: doktor.yildiz.toString()),
        SizedBox(width: 15),
        InfoCard(label: 'Tecrübe Yılı', value: doktor.yildiz.toString()),
        SizedBox(width: 15),
        InfoCard(label: 'Yıldız Sayısı', value: doktor.yildiz.toString()),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  final String label;
  final String value;

  const InfoCard({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 10,
        ),
        child: Column(
          children: <Widget>[
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
