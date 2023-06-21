import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:randevu/pages/profil.dart';
import 'package:randevu/pages/profilDoktor.dart';
import 'package:randevu/services/auth/auth_methods.dart';
import 'package:randevu/widgets/kategoriler.dart';
import 'package:randevu/widgets/doktorGoruntuleme.dart';
import 'package:randevu/pages/bildirimler.dart';
import 'package:randevu/widgets/vucutKitle.dart';
import 'ilanGoruntuleme.dart';



class HomePage extends StatefulWidget {
  final String category;

  const HomePage({Key? key, required this.category}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String kullaniciAdi='';
  String sifre='';
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        null;
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>   IlanListesi()),
        ).then((value) => setState(() {}));
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>   DoktorProfil()),
        );
        break;
      default:
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    List<dynamic>? data = ModalRoute.of(context)?.settings?.arguments as List?;

    if (data != null && data.isNotEmpty) {
      kullaniciAdi = data[0];
      sifre = data[1];
    } else {
      kullaniciAdi = 'default_username';
      sifre = 'default_password';
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,//back tuşunu kaldırma
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Ara...',
              border: InputBorder.none,
              icon: Icon(Icons.search),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Bildirimler()),
              );
            },
            icon: const Icon(Ionicons.notifications_outline),
          ),
          IconButton(
            onPressed: () {
              context
                  .read<FlutterFireAuthService>()
                  .logOut(context);
            },
            icon: const Icon(Ionicons.log_out_outline),
          ),          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => vucutKitle()),
              );
              },
            icon: const Icon(Ionicons.newspaper),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15), //Ekranı uzaklaştırdık
        children: [
          Text(
            "Kategoriler",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),

          Container(
            child: const Kategoriler(),
          ),
          const SizedBox(height: 20),
          Text(
            "Öne Çıkan Doktorlar",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 25),
          //Health Needs
          DoktorGoruntuleme(category: widget.category),

          const SizedBox(height: 15),
          //Harita
          //Nearby Doctors
        ],
      ),
      backgroundColor: Colors.lightBlueAccent,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Ionicons.home_sharp), label: "Ana Menü",),
      BottomNavigationBarItem(
              icon: Icon(Ionicons.list_circle), label: "Hasta Listesi"),

          BottomNavigationBarItem(
              icon: Icon(Ionicons.person), label: "Profilim"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

