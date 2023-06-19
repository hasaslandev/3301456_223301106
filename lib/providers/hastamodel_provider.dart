import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/hastaModel.dart';
import '../services/hastamodel/firestore_hastamodel_services.dart';


class HastaModelProvider with ChangeNotifier {

  final firestoreService = FirestoreHastamodelService();
  String? _hastaId;
  String? _ad;
  String? _soyad;
  String? _TC;
  String? _hastane;
  String? _telefon;
  String? _sehir;
  int? _yas;
  bool? _cinsiyet;
  String? _sifre;
  String? _resim;
  String? _email;

  var uuid = Uuid();

  String? get id => _hastaId;
  String? get ad => _ad;
  String? get soyad => _soyad;
  String? get TC => _TC;
  String? get hastane => _hastane;
  String? get telefon => _telefon;
  String? get sehir => _sehir;
  int? get yas => _yas;
  bool? get cinsiyet => _cinsiyet;
  String? get sifre => _sifre;
  String? get resim => _resim;
  String? get email => _email;

  changeName(String value) {
    _ad = value;
    notifyListeners();
  }
  changeSName(String value) {
    _soyad = value;
    notifyListeners();
  }

  changeTC(String value) {
    _TC = value;
    notifyListeners();
  }

  changeHastane(String value) {
    _hastane = value;
    notifyListeners();
  }

  changeTelefon(String value) {
    _telefon = value;
    notifyListeners();
  }
  changeSehir(String value) {
    _sehir = value;
    notifyListeners();
  }
  changeYas(int value) {
    _yas = value;
    notifyListeners();
  }
  changeCinsiyet(bool value) {
    _cinsiyet = value;
    notifyListeners();
  }
  changeSifre(String value) {
    _sifre = value;
    notifyListeners();
  }
  changeResim(String value) {
    _resim = value;
    notifyListeners();
  }
  changeEmail(String value) {
    _email = value;
    notifyListeners();
  }
  loadValues(HastaModel hastaModel) {
    _hastaId = hastaModel.hastaId;
    _ad = hastaModel.ad;
    _soyad = hastaModel.soyad;
    _TC= hastaModel.TC;
    _hastane = hastaModel.hastane;
    _telefon = hastaModel.telefon;
    _sehir = hastaModel.sehir;
    _yas = hastaModel.yas;
    _cinsiyet=hastaModel.cinsiyet;
    _sifre = hastaModel.sifre;
    _resim = hastaModel.resim;
    _email = hastaModel.email;
  }

  saveHastaModel() {
    if (_hastaId == null) {
      var newHastaModel = HastaModel(
          hastaId: uuid.v4(),
          ad: _ad,
          soyad: _soyad,
          TC: _TC,
          hastane: _hastane,
          telefon: _telefon,
          sehir: _sehir,
          yas: _yas,
          cinsiyet: cinsiyet,
          sifre: _sifre,
          resim: _resim,
          email: _email
      );
      firestoreService.saveHastaModel(newHastaModel);
    } else {
      //Update
      var updatedHastaModel = HastaModel(
          hastaId:id,
          ad: ad,
          soyad: soyad,
          TC: TC,
          hastane: hastane,
          sehir: sehir,
          yas: yas,
          cinsiyet: cinsiyet,
          sifre: sifre,
          resim: resim,
          email: email,
      );
      firestoreService.saveHastaModel(updatedHastaModel);
    }
  }

  removeHastaModel(String id) {
    firestoreService.removeHastaModel(id);
  }
}
