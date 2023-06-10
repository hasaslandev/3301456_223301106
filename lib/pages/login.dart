import 'package:flutter/material.dart';
import 'package:randevu/pages/anaSayfa.dart';
import 'package:randevu/pages/kaydol.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<Login> {


  String? kullaniciAdi = '';
  String? sifre = '';

  void kontrol() {
    if(kullaniciAdi!.length >= 9 && sifre!.length == 9){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
    else{
      print("Hata Sayfası");
    }
  }

  void kullaniciAdiText(String text) {
    setState(() {
      kullaniciAdi = text;
    });
  }

  void sifreText(String text) {
    setState(() {
      sifre = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool butonpasif = true;
    if (kullaniciAdi!.length >= 9 && sifre!.length == 9) {
      butonpasif = false;
    } else {
      butonpasif = true;
    }
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildFormField(
              ustYazi: 'Kullanıcı Adı',
              icYazi: 'Kullanıcı adınızı giriniz',
              icon: Icons.person,
              onChanged: kullaniciAdiText,
            ),
            const SizedBox(
              height: 16,
            ),
            _buildFormField(
              ustYazi: 'Şifre',
              icYazi: '*********',
              icon: Icons.lock,
              obscureText: true,
              onChanged: sifreText,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: butonpasif ? null : kontrol,
                  child: const Text('Giriş Yap',style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Kaydol()),
                    );
                  },
                  child: const Text('Kaydol'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){},
                  child: const Row(
                    children: [
                      Icon(Icons.login),
                      SizedBox(width: 10),
                      Text('Google İle Giriş Yap'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
     backgroundColor: Colors.deepPurpleAccent,

    );
  }

  Widget _buildFormField({
    required String ustYazi,
    required String icYazi,
    required IconData icon,
    bool obscureText = false,
    void Function(String text)? onChanged,
  }) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText,//Metni gizle
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5),
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.teal,
        ),
        hintText:  icYazi,
        hintStyle: const TextStyle(
          color: Colors.red,
        ),
        filled: true,
        fillColor: Colors.red[50],
        labelText: ustYazi,
        labelStyle: const TextStyle(
          color: Colors.red,
          height: 3,
        ),
      ),
    );
  }
}
