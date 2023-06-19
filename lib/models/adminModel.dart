class AdminModel {
  final String? adminId;
  final String? adminName;
  final String? sifre;

  AdminModel(
      {
        this.adminName,this.adminId,this.sifre
      });

  Map<String, dynamic> toMap() {
    return {
      'adminId': adminId,
      'adminName': adminName,
      'sifre': sifre,
    };
  }

  AdminModel.fromFirestore(Map<String, dynamic> firestore)
      : adminId = firestore['adminId'],
        adminName = firestore['adminName'],
        sifre = firestore['sifre'];
}
