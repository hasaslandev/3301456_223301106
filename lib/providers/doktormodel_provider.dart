import 'package:flutter/material.dart';
import 'package:randevu/models/doktorModel.dart';
import 'package:randevu/services/doctormodel/firestore_doctormodel_service.dart';
import 'package:uuid/uuid.dart';


class DoktorModelProvider with ChangeNotifier {

  final firestoreService = FirestoreDoctormodelService();
  String? _doctorId;
  String? _isim;
  String? _pozisyon;
  String? _bKisaAciklama;
  String? _resim;

  var uuid = Uuid();

  String? get id => _doctorId;

  String? get isim => _isim;

  String? get pozisyon => _pozisyon;

  String? get bKisaAciklama => _bKisaAciklama;

  String? get resim => _resim;

  changeName(String value) {
    _isim = value;
    notifyListeners();
  }

  changePozisyon(String value) {
    _pozisyon = value;
    notifyListeners();
  }

  changeKisaAciklama(String value) {
    _bKisaAciklama = value;
    notifyListeners();
  }

  changeResim(String value) {
    _resim = value;
    notifyListeners();
  }

  loadValues(DoktorModel doktorModel) {
    _doctorId = doktorModel.doctorId;
    _isim = doktorModel.isim;
    _pozisyon = doktorModel.pozisyon;
    _bKisaAciklama = doktorModel.bKisaAciklama;
    _resim = doktorModel.resim;
  }

  saveDoktorModel() {
    if (_doctorId == null) {
      var newDoktorModel = DoktorModel(
          doctorId: uuid.v4(),
          isim: _isim,
          pozisyon: _pozisyon,
          bKisaAciklama: _bKisaAciklama,
          resim: _resim);
      firestoreService.saveDoktorModel(newDoktorModel);
    } else {
      //Update
      var updatedDoktorModel = DoktorModel(
          doctorId:id,
          isim: isim,
          pozisyon: pozisyon,
          bKisaAciklama: bKisaAciklama,
          resim: resim);
      firestoreService.saveDoktorModel(updatedDoktorModel);
    }
  }

  removeDoktorModel(String id) {
    firestoreService.removeDoktorModel(id);
  }
}
