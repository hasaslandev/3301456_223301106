import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:randevu/models/telifModel.dart';

class FirestoreTeklifmodelService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveTeklifModel(TeklifModel teklifModel) {
    return _db
        .collection('teklifModel')
        .doc(teklifModel.teklifId)
        .set(teklifModel.toMap());
  }

  Stream<List<TeklifModel>> getTeklifModel() {
    return _db.collection('teklifModel').snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => TeklifModel.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeTeklifModel(String id) {
    return _db.collection('teklifModel').doc(id).delete();
  }
}
