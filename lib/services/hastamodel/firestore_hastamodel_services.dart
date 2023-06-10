import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:randevu/models/hastaModel.dart';

class FirestoreHastamodelService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveHastaModel(HastaModel hastaModel) {
    return _db
        .collection('hastaModel')
        .doc(hastaModel.hastaId)
        .set(hastaModel.toMap());
  }

  Stream<List<HastaModel>> getHastaModel() {
    return _db.collection('hastaModel').snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => HastaModel.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeHastaModel(String id) {
    return _db.collection('hastaModel').doc(id).delete();
  }
}
