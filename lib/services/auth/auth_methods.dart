import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:randevu/pages/anaSayfa.dart';
import 'package:randevu/screens/seotalep/seotalep_screen.dart';
import 'package:randevu/services/general/general_methods.dart';

import '../../models/doktorModel.dart';
import '../../screens/doktorLogin/login_screen.dart';

class FlutterFireAuthService {
  final FirebaseAuth _firebaseAuth;

  FlutterFireAuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<User?> createAccount(
      String name, String email, String password,
      String position,int stars,int views,String image,
      String shortDesc,String longDesc

      ) async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      User? user = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      if (user != null) {
        DoktorModel doktor = DoktorModel(
          doctorId: user.uid,
          isim: name,
          email: email,
          sifre: password,
          pozisyon: position,
          yildiz: stars,
          toplamGoruntulenme: views,
          resim: image,
          bKisaAciklama: shortDesc,
          bUzunAciklama: longDesc
        );

        await _firestore.collection('doktorModel').doc(user.uid).set(
          doktor.toMap(),
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
              return HomePage();
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
            context, MaterialPageRoute(builder: (_) => DoktorLoginScreen()));
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
