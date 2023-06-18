import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:randevu/models/hastaModel.dart';
import 'package:randevu/pages/anaSayfa.dart';
import 'package:randevu/screens/hastaLogin/hasta_login_screen.dart';
import 'package:randevu/services/general/general_methods.dart';


class FlutterFireAuthService2 {
  final FirebaseAuth _firebaseAuth;

  FlutterFireAuthService2(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<User?> createAccount(

      String hastaId,
   String ad,
   String soyad,
   String TC,
   String hastane,
   String email,
   String telefon,
   String sehir,
   int yas,
   bool cinsiyet,
   String sifre,

      ) async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      User? user = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: sifre,
      ))
          .user;

      if (user != null) {
        HastaModel hasta = HastaModel(
            hastaId: user.uid,
            ad: ad,
            soyad: soyad,
            TC: TC,
            hastane: hastane,
            email: email,
            telefon: telefon,
            sehir: sehir,
            yas: yas,
            cinsiyet: cinsiyet,
            sifre: sifre,
        );

        await _firestore.collection('hastaModel').doc(user.uid).set(
          hasta.toMap(),
        );

        return user;
      } else {
        return user;
      }
    } catch (e) {
      return null;
    }
  }

  Future<User?> logIn(
      String email, String password, BuildContext context) async {
    try {
      User? user = (await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomePage(category: 'Tümü',);
            },
          ),
        );
        return user;
      } else {
        showAlert("Error!", "Login Failed", context);
        return user;
      }
    } catch (e) {
      showAlert("Error!", e.toString(), context);
      return null;
    }
  }

  Future<void> logOut(BuildContext context) async {
    try {
      await _firebaseAuth.signOut().then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => HastaLoginScreen()));
      });
      showAlert("Good Bye", "Have a nice day!", context);
    } catch (e) {
    }
  }

  Future<dynamic> controlAuth() async {
    _firebaseAuth.authStateChanges().listen((User? user) {
    });
  }
}
