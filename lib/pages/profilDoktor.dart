import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DoktorProfil extends StatefulWidget {
  const DoktorProfil({Key? key}) : super(key: key);

  @override
  State<DoktorProfil> createState() => _DoktorProfilState();
}

class _DoktorProfilState extends State<DoktorProfil> {
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
          .collection('doktorModel')
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
    final TextEditingController nameController =
    TextEditingController(text: userData['isim'] as String?);
    final TextEditingController positionController =
    TextEditingController(text: userData['pozisyon'] as String?);
    final TextEditingController starController =
    TextEditingController(text: userData['yildiz']?.toString());
    final TextEditingController imageController =
    TextEditingController(text: userData['resim'] as String?);
    final TextEditingController shortDescController =
    TextEditingController(text: userData['bKisaAciklama'] as String?);
    final TextEditingController longDescController =
    TextEditingController(text: userData['bUzunAciklama'] as String?);
    final TextEditingController emailController =
    TextEditingController(text: userData['email'] as String?);
    final TextEditingController passwordController =
    TextEditingController(text: userData['sifre'] as String?);

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
            'Sayın ${userData['isim']}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'Profil',
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
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'İsim',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: positionController,
            decoration: const InputDecoration(
              labelText: 'Pozisyon',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.work),
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: starController,
            decoration: const InputDecoration(
              labelText: 'Yıldız',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.star),
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: imageController,
            decoration: const InputDecoration(
              labelText: 'Resim',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.image),
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: shortDescController,
            decoration: const InputDecoration(
              labelText: 'Kısa Açıklama',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.description),
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: longDescController,
            decoration: const InputDecoration(
              labelText: 'Uzun Açıklama',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.description),
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
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: 'Şifre',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
