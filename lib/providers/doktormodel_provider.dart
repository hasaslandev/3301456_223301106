import 'package:flutter/material.dart';
import 'package:randevu/models/doktorModel.dart';
import 'package:randevu/services/doctormodel/firestore_doctormodel_service.dart';
import 'package:uuid/uuid.dart';


class DoktorModelProvider with ChangeNotifier {

  final firestoreService = FirestoreDoctormodelService();
  String? _doctorId;
  String? _isim;
  String? _pozisyon;
  int? _yildiz;
  int? _toplamGoruntulenme;
  String? _resim;
  String? _bKisaAciklama;
  String? _bUzunAciklama;
  String? _email;
  String? _sifre;
  String? _telefon;



  var uuid = Uuid();

  String? get id => _doctorId;
  String? get isim => _isim;
  String? get pozisyon => _pozisyon;
  int? get yildiz => _yildiz;
  int? get toplamGoruntulenme => _toplamGoruntulenme;
  String? get resim => _resim;
  String? get bKisaAciklama => _bKisaAciklama;
  String? get bUzunAciklama => _bUzunAciklama;
  String? get email => _email;
  String? get sifre => _sifre;
  String? get telefon => _telefon;





  changeName(String value) {
    _isim = value;
    notifyListeners();
  }

  changePozisyon(String value) {
    _pozisyon = value;
    notifyListeners();
  }
  changeYildiz(int value) {
    _yildiz = value;
    notifyListeners();
  }
  changeToplamG(int value) {
    _toplamGoruntulenme = value;
    notifyListeners();
  }
  changeResim(String value) {
    _resim = value;
    notifyListeners();
  }
  changeKisaAciklama(String value) {
    _bKisaAciklama = value;
    notifyListeners();
  }
  changeUzunAciklama(String value) {
    _bUzunAciklama = value;
    notifyListeners();
  }
  changeEmail(String value) {
    _email = value;
    notifyListeners();
  }
  changeSifre(String value) {
    _sifre = value;
    notifyListeners();
  }
  changeTelefon(String value) {
    _telefon = value;
    notifyListeners();
  }


  loadValues(DoktorModel doktorModel) {
    _doctorId = doktorModel.doctorId;
    _isim = doktorModel.isim;
    _pozisyon = doktorModel.pozisyon;
    _yildiz = doktorModel.yildiz;
    _toplamGoruntulenme = doktorModel.toplamGoruntulenme;
    _resim = doktorModel.resim;
    _bKisaAciklama = doktorModel.bKisaAciklama;
    _bUzunAciklama = doktorModel.bUzunAciklama;
    _email = doktorModel.email;
    _sifre = doktorModel.sifre;
    _telefon = doktorModel.telefon;
  }

  saveDoktorModel() {
    if (_doctorId == null) {
      var newDoktorModel = DoktorModel(
          doctorId: uuid.v4(),
          isim: _isim,
          pozisyon: _pozisyon,
          yildiz: _yildiz,
          toplamGoruntulenme: _toplamGoruntulenme,
          resim: _resim,
          bKisaAciklama: _bKisaAciklama,
          bUzunAciklama: _bUzunAciklama,
          email: _email,
          sifre: _sifre,
          telefon: _telefon,
);
      firestoreService.saveDoktorModel(newDoktorModel);
    } else {
      //Update
      var updatedDoktorModel = DoktorModel(
          doctorId:id,
          isim: isim,
          pozisyon: pozisyon,
          yildiz: yildiz,
          toplamGoruntulenme: toplamGoruntulenme,
          resim: resim,
          bKisaAciklama: bKisaAciklama,
          bUzunAciklama: bUzunAciklama,
          email: email,
          sifre: sifre,
          telefon: telefon,


      );
      firestoreService.saveDoktorModel(updatedDoktorModel);
    }
  }

  removeDoktorModel(String id) {
    firestoreService.removeDoktorModel(id);
  }
}
