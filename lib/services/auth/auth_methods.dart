import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:randevu/models/doktorModel.dart';
import 'package:randevu/pages/anaSayfa.dart';
<<<<<<< HEAD
import 'package:randevu/pages/tasarim.dart';
=======
>>>>>>> 4f71c3f44aabc0e0e9f6859f880de09533f08820
import 'package:randevu/services/general/general_methods.dart';
import 'package:randevu/pages/anaSayfa.dart';



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

  Future<User?> logIn(String email, String password, BuildContext context) async {
    try {
      // Kullanıcının giriş yapacağı koleksiyon adı
      final String userCollection = 'doktorModel';

      User? user = (await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      if (user != null) {
        // Kullanıcının giriş yaptığı koleksiyonu kontrol etme
        final QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection(userCollection)
            .where("email", isEqualTo: email)
            .limit(1)
            .get();

        if (snapshot.docs.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HomePage(category: 'Tümü');
              },
            ),
          );
          return user;
        } else {
          showAlert("Error!", "Login Failed", context);
          await _firebaseAuth.signOut(); // Giriş yapılan kullanıcıyı otomatik olarak çıkış yap
          return null;
        }
      } else {
        showAlert("Error!", "Login Failed", context);
        return null;
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
            context, MaterialPageRoute(builder: (_) => DoctorLoginScreen()));
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
