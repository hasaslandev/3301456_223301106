import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:randevu/models/doktorModel.dart';

class FirestoreDoctormodelService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveDoktorModel(DoktorModel doktorModel) {
    return _db
        .collection('doktorModel')
        .doc(doktorModel.doctorId)
        .set(doktorModel.toMap());
  }

  Stream<List<DoktorModel>> getDoktorModel() {
    return _db.collection('doktorModel').snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => DoktorModel.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeDoktorModel(String id) {
    return _db.collection('doktorModel').doc(id).delete();
  }
}
