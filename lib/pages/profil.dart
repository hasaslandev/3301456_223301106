import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  User? user;
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    getUserData();
  }

  Future<void> getUserData() async {
    if (user != null) {
      final snapshot = await FirebaseFirestore.instance
          .collection('hastaModel')
          .doc(user!.uid)
          .get();

      if (snapshot.exists) {
        setState(() {
          userData = snapshot.data() as Map<String, dynamic>;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profilim"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AboutDoctor(userData: userData),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutDoctor extends StatelessWidget {
  final Map<String, dynamic> userData;

  const AboutDoctor({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController adController =
    TextEditingController(text: userData['ad'] as String?);
    final TextEditingController soyadController =
    TextEditingController(text: userData['soyad'] as String?);
    final TextEditingController hastaneController =
    TextEditingController(text: userData['hastane'] as String?);
    final TextEditingController tcController =
    TextEditingController(text: userData['TC'] as String?);
    final TextEditingController telefonController =
    TextEditingController(text: userData['telefon'] as String?);
    final TextEditingController sehirController =
    TextEditingController(text: userData['sehir'] as String?);
    final TextEditingController yasController =
    TextEditingController(text: userData['yas']?.toString());
    final TextEditingController cinsiyetController =
    TextEditingController(text: userData['cinsiyet']?.toString());
    final TextEditingController sifreController =
    TextEditingController(text: userData['sifre'] as String?);
    final TextEditingController emailController =
    TextEditingController(text: userData['email'] as String?);
    final TextEditingController resimController =
    TextEditingController(text: userData['resim'] as String?);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 65.0,
            backgroundImage: AssetImage(userData['resim'] as String),
            backgroundColor: Colors.white,
          ),
          const SizedBox(height: 16.0),
          Text(
            'Sy. ${userData['ad']} ${userData['soyad']}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'Profili',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Bilgilerinizi güncellemek için aşağıyı düzenleyin',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: adController,
            decoration: const InputDecoration(
              labelText: 'Ad',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: soyadController,
            decoration: const InputDecoration(
              labelText: 'Soyad',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: hastaneController,
            decoration: const InputDecoration(
              labelText: 'Hastane',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.local_hospital),
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: tcController,
            decoration: const InputDecoration(
              labelText: 'TC',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.confirmation_number),
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: telefonController,
            decoration: const InputDecoration(
              labelText: 'Telefon',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.phone),
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: sehirController,
            decoration: const InputDecoration(
              labelText: 'Şehir',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.location_city),
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: yasController,
            decoration: const InputDecoration(
              labelText: 'Yaş',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.cake),
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: cinsiyetController,
            decoration: const InputDecoration(
              labelText: 'Cinsiyet',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: sifreController,
            decoration: const InputDecoration(
              labelText: 'Şifre',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
