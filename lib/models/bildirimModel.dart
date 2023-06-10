class DoktorModel {
  final String? BildirimId;
  final String? TC;
  final bool? okundu;
  DoktorModel(
      {
        this.BildirimId,this.TC,this.okundu
      });

  Map<String, dynamic> toMap() {
    return {
      'BildirimId': BildirimId,
      'TC': TC,
      'okundu': okundu,

    };
  }

  DoktorModel.fromFirestore(Map<String, dynamic> firestore)
      : BildirimId = firestore['BildirimId'],
        TC = firestore['TC'],
        okundu = firestore['okundu'];
}
