import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DoktorDetay extends StatefulWidget {
  const DoktorDetay({Key? key}) : super(key: key);


  @override
  State<DoktorDetay> createState() => _DoktorDetayState();
}

class _DoktorDetayState extends State<DoktorDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            DoktorHakkinda(),
            DetailBody(),
          ],
        ),
      ),
    );
  }
}
class DoktorHakkinda extends StatelessWidget {
 // final DoktorModel doktorV;
 // const AboutDoctor({required this.doktorV});
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      child: const Column(
        children: <Widget>[
          CircleAvatar(
            radius: 65.0,
            backgroundImage: AssetImage("assets/images/beyincerrah_1.jpg"),
            backgroundColor: Colors.white,
          ),
          Text('Dr Hasan Aslan',style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          ),
          SizedBox(

            child: Text("doktorV.pozisyon",style:
              TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
              ),
          ),
          SizedBox(
            child: Text("doktorV.bKisaAciklama.toString()",style:
            TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            child: Text("doktorV.bUzunAciklama.toString()"
              ,style:
            TextStyle(
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
  const DetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 30),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DoctorInfo(),
          Text("Burası harita alanı olacaktır."),
        ],
      ),
    );
  }
}
class DoctorInfo extends StatelessWidget {
  const DoctorInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        InfoCard(label: 'Tedavi Edilen Hasta Sayısı', value: '109'),
        SizedBox(width: 15,),
        InfoCard(label: 'Tecrübe Yılı', value: '10 Yıl'),
        SizedBox(width: 15,),
        InfoCard(label: 'Yıldız Sayısı', value: '4.6'),
      ],
    );
  }
}
class InfoCard extends StatelessWidget {
  const InfoCard({Key? key,required this.label,required this.value}) : super(key: key);
final String label;
final String value;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blue,
      ),
      padding: const  EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 15,
      ),
      child: Column(
        children:  <Widget>[
          Text(label,style:const TextStyle(
            color: Colors.black,fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          ),
          const SizedBox(height: 10,),
          Text(value,style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),)
        ],
      ),
    ))
    ;
  }
}



