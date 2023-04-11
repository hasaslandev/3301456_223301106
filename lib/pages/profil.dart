import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:randevu/widgets/Guncelleme.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _DoktorDetayState();
}

class _DoktorDetayState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teklif Paneli"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children:  const <Widget>[
            AboutDoctor(),
            Expanded(
              child: Guncelleme(),
            ),
          ],
        ),
      ),
    );
  }
}
class AboutDoctor extends StatelessWidget {
  const AboutDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      child: Column(
        children:const <Widget>[
          CircleAvatar(
            radius: 65.0,
            backgroundImage: AssetImage('assets/images/doctor_2.jpg'),
            backgroundColor: Colors.white,
          ),
          Text('Sy. Nurullah Ateş',style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          ),
          SizedBox(

            child: Text('Profili',style:
            TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            child: Text('Bilgilerinizi güncellemek aşşağıyı düzenleyin',style:
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
