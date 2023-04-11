import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randevu/pages/home_page.dart';
import 'package:randevu/pages/kaydol.dart';
import 'package:randevu/pages/login.dart';
import 'package:randevu/widgets/Guncelleme.dart';
import 'package:randevu/pages/teklif.dart';
import 'package:randevu/pages/doctorpage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        colorSchemeSeed: const Color(0xff5a73d8),
        textTheme:
            GoogleFonts.plusJakartaSansTextTheme(Theme.of(context).textTheme),
      useMaterial3: true,
      ),


    initialRoute: '/', routes: { '/login': (context) => const Login(), '/home_page': (context) => const HomePage(),'/kaydol': (context) =>  Kaydol(),
      '/teklif': (context) =>  const Teklif(),'/Guncelleme': (context) =>  Guncelleme(),'/doctorpage': (context) =>  DoktorDetay(),},
      home: Login(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return const Placeholder();
  }
}

